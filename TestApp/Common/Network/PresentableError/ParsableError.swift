//
//  ParsableError.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//


import Foundation

struct ParsableError: Decodable, PresentableError {
  
  // MARK: - Properties
  
  private let message: String
  let type: String
  let errors: [DetailError]?
  
  // MARK: - Nested struct
  
  struct DetailError: Decodable {
    let name: String
    let message: String
  }
  
  // MARK: - PresentableError
  
  var userMessage: String {
    return message
  }
  
  var isNetworkError: Bool {
    return false
  }
}
