//
//  EndpointProtocol.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//

import Foundation
import Alamofire

public typealias Parameters = [String: Any]
public typealias Method = HTTPMethod
public typealias Headers = Alamofire.HTTPHeaders

protocol EndpointProtocol {
    var baseUrl: URL? { get }
    var path: String { get }
    var method: Method { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: Headers? { get }
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { get }
}

extension EndpointProtocol {
    
    var baseUrl: URL? {
        return URL(string: ServiceConstants.feedbackUrl)
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.queryString
        default:
            return URLEncoding.default
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var headers: Headers? {
        return [:]
    }
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }
}
