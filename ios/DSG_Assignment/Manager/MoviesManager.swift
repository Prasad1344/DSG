//
//  MoviesManager.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 28/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation

class MoviesManager {
    
    static let shared = MoviesManager()
    fileprivate var popularMoviesPage: Int = 0
    
    
    func getEventList(success: @escaping(([EventEntity])->Void), fail: @escaping(_ error: NSError)->Void) {
        
        NetworkManager.shared.fetchData(url: apiType.eventList) { response in
            
            var result: [EventEntity] = []
            
            for dict in (response["events"] as? [[String:Any]]) ?? [] {
                result.append(EventEntity(fromDictionary: dict))
            }
            success(result)
        } fail: { error in
            fail(error)
        }
    }
    
    func searchEvents(text: String, success: @escaping(([EventEntity])->Void), fail: @escaping(_ error: NSError)->Void) {
        
        NetworkManager.shared.fetchData(url: apiType.searchEvents(text)) { response in
            
            var result: [EventEntity] = []
            
            for dict in (response["events"] as? [[String:Any]]) ?? [] {
                result.append(EventEntity(fromDictionary: dict))
            }
            success(result)
        } fail: { error in
            fail(error)
        }
    }
}
