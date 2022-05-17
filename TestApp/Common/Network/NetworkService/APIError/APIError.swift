//
//  APIError.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//

import Foundation

enum APIError: Error, LocalizedError {
    case noBaseUrl
    case noNetwork
    case serverError(error: Error?, response: HTTPURLResponse?, data: Data?)
    case notAuthorized
    case parsableError(ParsableError)
    case decodingError
    case custom(_ error: String?)
    
    // MARK: - LocalizedError
    
    var statusCode: Int? {
        switch self {
        case .serverError(_, let response, _):
            return response?.statusCode
        default:
            return nil
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .noBaseUrl:
            return "No base URL provided."
        case .noNetwork:
            return "No network connection."
        case .serverError(let error, let response, _):
            var resultString = "Server error."
            if let response = response {
                resultString += " Status code: \(response.statusCode)"
            }
            if let error = error {
                resultString += " Error description: \(error.localizedDescription)"
            }
            return resultString
        case .notAuthorized:
            return "User should be authorized."
        case .decodingError:
            return "Error decoding object."
        case .custom(let error):
            guard let err = error else {
                return "Custom error. Additional info not provided."
            }
            return "Custom error. Additional info: \(err)"
        case .parsableError(let error):
            return error.userMessage
        }
    }
}

// MARK: - Equatable

extension APIError: Equatable {
    
    static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case (.noBaseUrl, .noBaseUrl):
            return true
        case (.noNetwork, .noNetwork):
            return true
        case (.notAuthorized, .notAuthorized):
            return true
        case (.decodingError, .decodingError):
            return true
        case (.custom(let lhs), .custom(let rhs)):
            return lhs == rhs
        case (.serverError(_, let lhsResp, let lhsData), .serverError(_, let rhsResp, let rhsData)):
            return lhsResp?.statusCode == rhsResp?.statusCode && lhsData == rhsData
        default:
            return false
        }
    }
}
