//
//  Helper.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 29/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    static let shared = Helper()
    
    
    func ShowError(_ message : String? = nil) {
        
        ShowActionSheet(title: "MovieBox", message: message, actions: [UIAlertAction(title: "Ok", style: .default, handler: nil)])
    }
    
    func ShowActionSheet(title: String? = nil, message : String? = nil, actions: [UIAlertAction])
    {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actions {
            alertView.addAction(action)
        }
        
        topController?.present(alertView, animated: true, completion: nil)
    }
}
