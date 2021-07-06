//
//  AppConstant.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 26/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation

let BaseImageUrl = "https://image.tmdb.org/t/p/w500/"

struct apiType {
    
    static let eventList = "https://api.seatgeek.com/2/events?client_id=MjIzODAxOTh8MTYyNDg4NzU5MS40NTU2NTQ0"
    
    static func searchEvents(_ search: String) -> String {
        return "https://api.seatgeek.com/2/events?client_id=MjIzODAxOTh8MTYyNDg4NzU5MS40NTU2NTQ0&q=\(search)"
    }
}

enum controllerType: String {
    
    case movieDetail = "EventDetailVC"
    
    //storyboard
    enum storyboard {
        case main
    }
    
    func storyboardType(controller: controllerType) -> storyboard {
        switch controller {
        
        case .movieDetail:
            return storyboard.main
        }
    }
}

struct storyboards {
    static let main = "Main"
}

@objc enum cellType: Int {
    case table = 0
    case collection
}
