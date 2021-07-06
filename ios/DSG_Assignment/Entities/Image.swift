//
//	Image.swift
//
//	Create by Prasadarao upputuri on 6/7/2021
//	Copyright © 2021. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Image : NSObject, NSCoding{

	var huge : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		huge = dictionary["huge"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if huge != nil{
			dictionary["huge"] = huge
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         huge = aDecoder.decodeObject(forKey: "huge") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if huge != nil{
			aCoder.encode(huge, forKey: "huge")
		}

	}

}
