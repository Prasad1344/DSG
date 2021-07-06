//
//  NavigationManager.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 29/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation
import UIKit

class NavigationManager {
    
    static let shared = NavigationManager()
    
    let storyboard = UIStoryboard(name: storyboards.main, bundle: nil)
    
    func getController(_ controller: controllerType) -> UIViewController {
        switch controller.storyboardType(controller: controller) {
        case .main:
            return storyboard.instantiateViewController(withIdentifier: controller.rawValue)
        }
    }
}
