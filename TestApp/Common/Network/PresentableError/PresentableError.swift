//
//  PresentableError.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//


import Foundation

protocol PresentableError where Self: Error {
  var userMessage: String { get }
  var isNetworkError: Bool { get }
}

extension APIError {
  var isNetworkError: Bool {
    switch self {
    case .noNetwork:    return true
    default:            return false
    }
  }
}
