//
//	EventEntity.swift
//
//	Create by Prasadarao upputuri on 6/7/2021
//	Copyright © 2021. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class EventEntity : NSObject {

	var accessMethod : AnyObject!
	var announceDate : String!
	var announcements : Announcement!
	var conditional : Bool!
	var createdAt : String!
	var dateTbd : Bool!
	var datetimeLocal : String!
	var datetimeTbd : Bool!
	var datetimeUtc : String!
	var descriptionField : String!
	var domainInformation : [AnyObject]!
	var enddatetimeUtc : AnyObject!
	var eventPromotion : AnyObject!
	var id : Int!
	var isOpen : Bool!
	var links : [AnyObject]!
	var performers : [Performer]!
	var popularity : Int!
	var score : Int!
	var shortTitle : String!
	var stats : Stat!
	var status : String!
	var taxonomies : [Taxonomy]!
	var themes : [AnyObject]!
	var timeTbd : Bool!
	var title : String!
	var type : String!
	var url : String!
	var venue : Venue!
	var visibleUntilUtc : String!
    var localDate: String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		accessMethod = dictionary["access_method"] as? AnyObject
		announceDate = dictionary["announce_date"] as? String
		if let announcementsData = dictionary["announcements"] as? [String:Any]{
			announcements = Announcement(fromDictionary: announcementsData)
		}
		conditional = dictionary["conditional"] as? Bool
		createdAt = dictionary["created_at"] as? String
		dateTbd = dictionary["date_tbd"] as? Bool
		datetimeLocal = dictionary["datetime_local"] as? String
		datetimeTbd = dictionary["datetime_tbd"] as? Bool
		datetimeUtc = dictionary["datetime_utc"] as? String
		descriptionField = dictionary["description"] as? String
		domainInformation = dictionary["domain_information"] as? [AnyObject]
		enddatetimeUtc = dictionary["enddatetime_utc"] as? AnyObject
		eventPromotion = dictionary["event_promotion"] as? AnyObject
		id = dictionary["id"] as? Int
		isOpen = dictionary["is_open"] as? Bool
		links = dictionary["links"] as? [AnyObject]
		performers = [Performer]()
		if let performersArray = dictionary["performers"] as? [[String:Any]]{
			for dic in performersArray{
				let value = Performer(fromDictionary: dic)
				performers.append(value)
			}
		}
		popularity = dictionary["popularity"] as? Int
		score = dictionary["score"] as? Int
		shortTitle = dictionary["short_title"] as? String
		if let statsData = dictionary["stats"] as? [String:Any]{
			stats = Stat(fromDictionary: statsData)
		}
		status = dictionary["status"] as? String
		taxonomies = [Taxonomy]()
		if let taxonomiesArray = dictionary["taxonomies"] as? [[String:Any]]{
			for dic in taxonomiesArray{
				let value = Taxonomy(fromDictionary: dic)
				taxonomies.append(value)
			}
		}
		themes = dictionary["themes"] as? [AnyObject]
		timeTbd = dictionary["time_tbd"] as? Bool
		title = dictionary["title"] as? String
		type = dictionary["type"] as? String
		url = dictionary["url"] as? String
		if let venueData = dictionary["venue"] as? [String:Any]{
			venue = Venue(fromDictionary: venueData)
		}
		visibleUntilUtc = dictionary["visible_until_utc"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if accessMethod != nil{
			dictionary["access_method"] = accessMethod
		}
		if announceDate != nil{
			dictionary["announce_date"] = announceDate
		}
		if announcements != nil{
			dictionary["announcements"] = announcements.toDictionary()
		}
		if conditional != nil{
			dictionary["conditional"] = conditional
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if dateTbd != nil{
			dictionary["date_tbd"] = dateTbd
		}
		if datetimeLocal != nil{
			dictionary["datetime_local"] = datetimeLocal
		}
		if datetimeTbd != nil{
			dictionary["datetime_tbd"] = datetimeTbd
		}
		if datetimeUtc != nil{
			dictionary["datetime_utc"] = datetimeUtc
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if domainInformation != nil{
			dictionary["domain_information"] = domainInformation
		}
		if enddatetimeUtc != nil{
			dictionary["enddatetime_utc"] = enddatetimeUtc
		}
		if eventPromotion != nil{
			dictionary["event_promotion"] = eventPromotion
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isOpen != nil{
			dictionary["is_open"] = isOpen
		}
		if links != nil{
			dictionary["links"] = links
		}
		if performers != nil{
			var dictionaryElements = [[String:Any]]()
			for performersElement in performers {
				dictionaryElements.append(performersElement.toDictionary())
			}
			dictionary["performers"] = dictionaryElements
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if score != nil{
			dictionary["score"] = score
		}
		if shortTitle != nil{
			dictionary["short_title"] = shortTitle
		}
		if stats != nil{
			dictionary["stats"] = stats.toDictionary()
		}
		if status != nil{
			dictionary["status"] = status
		}
		if taxonomies != nil{
			var dictionaryElements = [[String:Any]]()
			for taxonomiesElement in taxonomies {
				dictionaryElements.append(taxonomiesElement.toDictionary())
			}
			dictionary["taxonomies"] = dictionaryElements
		}
		if themes != nil{
			dictionary["themes"] = themes
		}
		if timeTbd != nil{
			dictionary["time_tbd"] = timeTbd
		}
		if title != nil{
			dictionary["title"] = title
		}
		if type != nil{
			dictionary["type"] = type
		}
		if url != nil{
			dictionary["url"] = url
		}
		if venue != nil{
			dictionary["venue"] = venue.toDictionary()
		}
		if visibleUntilUtc != nil{
			dictionary["visible_until_utc"] = visibleUntilUtc
		}
		return dictionary
	}
    
    override func getCellIdentifier(_ type: cellType) -> String {
        return String(describing: EventCell.self)
    }
}
