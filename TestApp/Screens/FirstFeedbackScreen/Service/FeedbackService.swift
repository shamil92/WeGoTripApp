//
//  FeedbackService.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//


import Foundation

protocol OrderService {
    func createFeeback(model: FeedbackRequestModel,completion: @escaping(NetworkResult<FeedbackRequestModel>) -> Void)
}

final class OrderServiceImp: OrderService {
    
    static let shared = OrderServiceImp(networkService: NetworkService<OrderEndpoint>())
    
    let networkService: NetworkService<OrderEndpoint>
    
    init(networkService: NetworkService<OrderEndpoint>) {
        self.networkService = networkService
    }
    
    func createFeeback(model: FeedbackRequestModel, completion: @escaping (NetworkResult<FeedbackRequestModel>) -> Void) {
        let endpoint = OrderEndpoint.addFeedback(model: model)
        networkService.request(endpoint: endpoint, completion: completion)
    }
}
