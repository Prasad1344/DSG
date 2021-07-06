//
//	Performer.swift
//
//	Create by Prasadarao upputuri on 6/7/2021
//	Copyright © 2021. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Performer : NSObject, NSCoding{

	var colors : AnyObject!
	var divisions : AnyObject!
	var hasUpcomingEvents : Bool!
	var homeVenueId : AnyObject!
	var id : Int!
	var image : String!
	var imageAttribution : String!
	var imageLicense : String!
	var images : Image!
	var location : AnyObject!
	var name : String!
	var numUpcomingEvents : Int!
	var popularity : Int!
	var primary : Bool!
	var score : Float!
	var shortName : String!
	var slug : String!
	var stats : Stat!
	var taxonomies : [Taxonomy]!
	var type : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		colors = dictionary["colors"] as? AnyObject
		divisions = dictionary["divisions"] as? AnyObject
		hasUpcomingEvents = dictionary["has_upcoming_events"] as? Bool
		homeVenueId = dictionary["home_venue_id"] as? AnyObject
		id = dictionary["id"] as? Int
		image = dictionary["image"] as? String
		imageAttribution = dictionary["image_attribution"] as? String
		imageLicense = dictionary["image_license"] as? String
		if let imagesData = dictionary["images"] as? [String:Any]{
			images = Image(fromDictionary: imagesData)
		}
		location = dictionary["location"] as? AnyObject
		name = dictionary["name"] as? String
		numUpcomingEvents = dictionary["num_upcoming_events"] as? Int
		popularity = dictionary["popularity"] as? Int
		primary = dictionary["primary"] as? Bool
		score = dictionary["score"] as? Float
		shortName = dictionary["short_name"] as? String
		slug = dictionary["slug"] as? String
		if let statsData = dictionary["stats"] as? [String:Any]{
			stats = Stat(fromDictionary: statsData)
		}
		taxonomies = [Taxonomy]()
		if let taxonomiesArray = dictionary["taxonomies"] as? [[String:Any]]{
			for dic in taxonomiesArray{
				let value = Taxonomy(fromDictionary: dic)
				taxonomies.append(value)
			}
		}
		type = dictionary["type"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if colors != nil{
			dictionary["colors"] = colors
		}
		if divisions != nil{
			dictionary["divisions"] = divisions
		}
		if hasUpcomingEvents != nil{
			dictionary["has_upcoming_events"] = hasUpcomingEvents
		}
		if homeVenueId != nil{
			dictionary["home_venue_id"] = homeVenueId
		}
		if id != nil{
			dictionary["id"] = id
		}
		if image != nil{
			dictionary["image"] = image
		}
		if imageAttribution != nil{
			dictionary["image_attribution"] = imageAttribution
		}
		if imageLicense != nil{
			dictionary["image_license"] = imageLicense
		}
		if images != nil{
			dictionary["images"] = images.toDictionary()
		}
		if location != nil{
			dictionary["location"] = location
		}
		if name != nil{
			dictionary["name"] = name
		}
		if numUpcomingEvents != nil{
			dictionary["num_upcoming_events"] = numUpcomingEvents
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if primary != nil{
			dictionary["primary"] = primary
		}
		if score != nil{
			dictionary["score"] = score
		}
		if shortName != nil{
			dictionary["short_name"] = shortName
		}
		if slug != nil{
			dictionary["slug"] = slug
		}
		if stats != nil{
			dictionary["stats"] = stats.toDictionary()
		}
		if taxonomies != nil{
			var dictionaryElements = [[String:Any]]()
			for taxonomiesElement in taxonomies {
				dictionaryElements.append(taxonomiesElement.toDictionary())
			}
			dictionary["taxonomies"] = dictionaryElements
		}
		if type != nil{
			dictionary["type"] = type
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         colors = aDecoder.decodeObject(forKey: "colors") as? AnyObject
         divisions = aDecoder.decodeObject(forKey: "divisions") as? AnyObject
         hasUpcomingEvents = aDecoder.decodeObject(forKey: "has_upcoming_events") as? Bool
         homeVenueId = aDecoder.decodeObject(forKey: "home_venue_id") as? AnyObject
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? String
         imageAttribution = aDecoder.decodeObject(forKey: "image_attribution") as? String
         imageLicense = aDecoder.decodeObject(forKey: "image_license") as? String
         images = aDecoder.decodeObject(forKey: "images") as? Image
         location = aDecoder.decodeObject(forKey: "location") as? AnyObject
         name = aDecoder.decodeObject(forKey: "name") as? String
         numUpcomingEvents = aDecoder.decodeObject(forKey: "num_upcoming_events") as? Int
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Int
         primary = aDecoder.decodeObject(forKey: "primary") as? Bool
         score = aDecoder.decodeObject(forKey: "score") as? Float
         shortName = aDecoder.decodeObject(forKey: "short_name") as? String
         slug = aDecoder.decodeObject(forKey: "slug") as? String
         stats = aDecoder.decodeObject(forKey: "stats") as? Stat
         taxonomies = aDecoder.decodeObject(forKey :"taxonomies") as? [Taxonomy]
         type = aDecoder.decodeObject(forKey: "type") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if colors != nil{
			aCoder.encode(colors, forKey: "colors")
		}
		if divisions != nil{
			aCoder.encode(divisions, forKey: "divisions")
		}
		if hasUpcomingEvents != nil{
			aCoder.encode(hasUpcomingEvents, forKey: "has_upcoming_events")
		}
		if homeVenueId != nil{
			aCoder.encode(homeVenueId, forKey: "home_venue_id")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if imageAttribution != nil{
			aCoder.encode(imageAttribution, forKey: "image_attribution")
		}
		if imageLicense != nil{
			aCoder.encode(imageLicense, forKey: "image_license")
		}
		if images != nil{
			aCoder.encode(images, forKey: "images")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if numUpcomingEvents != nil{
			aCoder.encode(numUpcomingEvents, forKey: "num_upcoming_events")
		}
		if popularity != nil{
			aCoder.encode(popularity, forKey: "popularity")
		}
		if primary != nil{
			aCoder.encode(primary, forKey: "primary")
		}
		if score != nil{
			aCoder.encode(score, forKey: "score")
		}
		if shortName != nil{
			aCoder.encode(shortName, forKey: "short_name")
		}
		if slug != nil{
			aCoder.encode(slug, forKey: "slug")
		}
		if stats != nil{
			aCoder.encode(stats, forKey: "stats")
		}
		if taxonomies != nil{
			aCoder.encode(taxonomies, forKey: "taxonomies")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
