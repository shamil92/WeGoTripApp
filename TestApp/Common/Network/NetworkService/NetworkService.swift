//
//  NetworkService.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//

import Foundation
import Alamofire

// MARK: - Network Service Implementation
final class NetworkService<Endpoint: EndpointProtocol> {
    
    // MARK: - Init
    
    init() {
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.millisecondsSince1970
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.headers = .default
        
        alamofireManager = Alamofire.Session(configuration: sessionConfiguration)
    }
    
    // MARK: - Properties
    
    private let decoder: JSONDecoder
    private let alamofireManager: Session
    
    // MARK: - Request
    
    func request<Response>(
        endpoint: Endpoint,
        completion: @escaping (NetworkResult<Response>) -> Void) where Response: Decodable {
            guard let baseUrl = endpoint.baseUrl else {
                completion(NetworkResult.failure(.noBaseUrl))
                return
            }
            
            decoder.keyDecodingStrategy = endpoint.keyDecodingStrategy
            
            let url = baseUrl.appendingPathComponent(endpoint.path)
            
            alamofireManager.request(url, method: endpoint.method,
                                     parameters: endpoint.parameters,
                                     encoding: endpoint.encoding,
                                     headers: endpoint.headers).response { [weak self] response in
                
                guard let self = self else {
                    return
                }
                
                let result: NetworkResult<Response>
                
                defer {
                    DispatchQueue.main.async {
                        completion(result)
                    }
                }
                
                guard response.response != nil else {
                    result = NetworkResult.failure(APIError.noNetwork)
                    return
                }
            
                
                do {
                    result = NetworkResult.success(response.data ?? Data())
                } catch (let error) {
                    NSLog(error.localizedDescription)
                    result = NetworkResult.failure(.decodingError)
                }
            }
            
        }
    
    // MARK: - Server Error methods
    
    private func createServerError(from response: AFDataResponse<Data?>) -> APIError {
        guard let data = response.data else {
            return APIError.serverError(error: response.error, response: response.response, data: response.data)
        }
        
        do {
            let error = try decoder.decode(ParsableError.self, from: data)
            return APIError.parsableError(error)
            
        } catch {
            return APIError.serverError(error: response.error, response: response.response, data: response.data)
        }
    }
    
}
