//
//  URLSessionManager.swift
//  TestApp
//
//  Created by Shamil on 17.05.2022.
//

import UIKit


protocol UpdateViewControllerDelegate {
    func update(data:Data)
}

class NetworkServiceManager {
    
    
    var view: UpdateViewControllerDelegate? = nil

    static let shared = NetworkServiceManager()
    
    func getImage() {
        guard let url = URL(string: ServiceConstants.imageUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
        
            
            guard let data = data else { return }
            
            do {
                
                DispatchQueue.main.async {
                    self.view?.update(data: data)
                }
            }
        }.resume()
    }
}
