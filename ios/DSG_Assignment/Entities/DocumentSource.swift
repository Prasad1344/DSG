//
//	DocumentSource.swift
//
//	Create by Prasadarao upputuri on 6/7/2021
//	Copyright © 2021. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DocumentSource : NSObject, NSCoding{

	var generationType : String!
	var sourceType : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		generationType = dictionary["generation_type"] as? String
		sourceType = dictionary["source_type"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if generationType != nil{
			dictionary["generation_type"] = generationType
		}
		if sourceType != nil{
			dictionary["source_type"] = sourceType
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         generationType = aDecoder.decodeObject(forKey: "generation_type") as? String
         sourceType = aDecoder.decodeObject(forKey: "source_type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if generationType != nil{
			aCoder.encode(generationType, forKey: "generation_type")
		}
		if sourceType != nil{
			aCoder.encode(sourceType, forKey: "source_type")
		}

	}

}
