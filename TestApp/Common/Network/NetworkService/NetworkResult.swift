//
//  NetworkResult.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//

import Foundation


typealias EmptyCompletion = (NetworkResult<Codable>) -> Void

enum NetworkResult<Model> {
  
  case success(Data)
  case failure(APIError)
  
  // Returns `true` if the result is a success, `false` otherwise.
  
  public var isSuccess: Bool {
    
    switch self {
    case .success:      return true
    case .failure:      return false
    }
  }
  
  // Returns `true` if the result is a failure, `false` otherwise.
  
  public var isFailure: Bool {
    return !isSuccess
  }
  
  // Returns the associated value if the result is a success, `nil` otherwise.
  
  public var value: Model? {
    
    switch self {
    case .success(_):   return nil
    case .failure:              return nil
    }
  }
  
  // Returns the associated error value if the result is a failure, `nil` otherwise.
  
  public var error: APIError? {
    
    switch self {
    case .success:              return nil
    case .failure(let error):   return error
    }
  }
}

// MARK: - Equatable
extension NetworkResult: Equatable where Model: Equatable {
  
  static func == (lhs: NetworkResult, rhs: NetworkResult) -> Bool {
    
    switch (lhs, rhs) {
    case (.success(let lhs), .success(let rhs)):
      return lhs == rhs
    case (.failure(let lhs), .failure(let rhs)):
      return lhs == rhs
    default:
      return false
    }
  }
}
