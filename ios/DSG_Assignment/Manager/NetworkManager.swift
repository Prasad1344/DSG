//
//  NetworkManager.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 28/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    
    func fetchData(url: String, success: @escaping (Dictionary<String,Any>) -> Void, fail: @escaping (_ error: NSError)->Void) {
        
        dataTask?.cancel()
        
        guard let url = URL(string: url) else {
            return
        }
        
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    fail(error as NSError)
                }
            } else if let data = data {
                
                do {
                    if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        DispatchQueue.main.async {
                            success(response)
                        }
                    }
                } catch let error as NSError {
                    DispatchQueue.main.async {
                        fail(error)
                    }
                }
            }
        }
        
        dataTask?.resume()
    }
}
