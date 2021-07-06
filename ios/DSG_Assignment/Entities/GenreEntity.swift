//
//  GenreEntity.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 29/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation
import UIKit

class GenreEntity : NSObject {

	var id : Int!
	var name : String!
    
	init(fromDictionary dictionary: [String:Any]){
		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
	}
    
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		return dictionary
	}
    
    override func getCellIdentifier(_ type: cellType) -> String {
        return String(describing: GenersCollectionCell.self)
    }
    
    override func getCellSize() -> CGSize {
        return CGSize(width: name.widthOfString(UIFont(name: "HelveticaNeue", size: 14)!)+8, height: 30)
    }
}
