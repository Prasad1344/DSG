//
//	Taxonomy.swift
//
//	Create by Prasadarao upputuri on 6/7/2021
//	Copyright © 2021. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Taxonomy : NSObject {

	var documentSource : DocumentSource!
	var id : Int!
	var name : String!
	var parentId : Int!
	var rank : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let documentSourceData = dictionary["document_source"] as? [String:Any]{
			documentSource = DocumentSource(fromDictionary: documentSourceData)
		}
		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
		parentId = dictionary["parent_id"] as? Int
		rank = dictionary["rank"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if documentSource != nil{
			dictionary["document_source"] = documentSource.toDictionary()
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if parentId != nil{
			dictionary["parent_id"] = parentId
		}
		if rank != nil{
			dictionary["rank"] = rank
		}
		if parentId != nil{
			dictionary["parent_id"] = parentId
		}
		return dictionary
	}
}
