//
//	Stat.swift
//
//	Create by Prasadarao upputuri on 6/7/2021
//	Copyright © 2021. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Stat : NSObject, NSCoding{

	var eventCount : Int!
	var averagePrice : AnyObject!
	var dqBucketCounts : AnyObject!
	var highestPrice : AnyObject!
	var listingCount : AnyObject!
	var lowestPrice : AnyObject!
	var lowestPriceGoodDeals : AnyObject!
	var lowestSgBasePrice : AnyObject!
	var lowestSgBasePriceGoodDeals : AnyObject!
	var medianPrice : AnyObject!
	var visibleListingCount : AnyObject!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		eventCount = dictionary["event_count"] as? Int
		averagePrice = dictionary["average_price"] as? AnyObject
		dqBucketCounts = dictionary["dq_bucket_counts"] as? AnyObject
		highestPrice = dictionary["highest_price"] as? AnyObject
		listingCount = dictionary["listing_count"] as? AnyObject
		lowestPrice = dictionary["lowest_price"] as? AnyObject
		lowestPriceGoodDeals = dictionary["lowest_price_good_deals"] as? AnyObject
		lowestSgBasePrice = dictionary["lowest_sg_base_price"] as? AnyObject
		lowestSgBasePriceGoodDeals = dictionary["lowest_sg_base_price_good_deals"] as? AnyObject
		medianPrice = dictionary["median_price"] as? AnyObject
		visibleListingCount = dictionary["visible_listing_count"] as? AnyObject
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if eventCount != nil{
			dictionary["event_count"] = eventCount
		}
		if averagePrice != nil{
			dictionary["average_price"] = averagePrice
		}
		if dqBucketCounts != nil{
			dictionary["dq_bucket_counts"] = dqBucketCounts
		}
		if highestPrice != nil{
			dictionary["highest_price"] = highestPrice
		}
		if listingCount != nil{
			dictionary["listing_count"] = listingCount
		}
		if lowestPrice != nil{
			dictionary["lowest_price"] = lowestPrice
		}
		if lowestPriceGoodDeals != nil{
			dictionary["lowest_price_good_deals"] = lowestPriceGoodDeals
		}
		if lowestSgBasePrice != nil{
			dictionary["lowest_sg_base_price"] = lowestSgBasePrice
		}
		if lowestSgBasePriceGoodDeals != nil{
			dictionary["lowest_sg_base_price_good_deals"] = lowestSgBasePriceGoodDeals
		}
		if medianPrice != nil{
			dictionary["median_price"] = medianPrice
		}
		if visibleListingCount != nil{
			dictionary["visible_listing_count"] = visibleListingCount
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         eventCount = aDecoder.decodeObject(forKey: "event_count") as? Int
         averagePrice = aDecoder.decodeObject(forKey: "average_price") as? AnyObject
         dqBucketCounts = aDecoder.decodeObject(forKey: "dq_bucket_counts") as? AnyObject
         highestPrice = aDecoder.decodeObject(forKey: "highest_price") as? AnyObject
         listingCount = aDecoder.decodeObject(forKey: "listing_count") as? AnyObject
         lowestPrice = aDecoder.decodeObject(forKey: "lowest_price") as? AnyObject
         lowestPriceGoodDeals = aDecoder.decodeObject(forKey: "lowest_price_good_deals") as? AnyObject
         lowestSgBasePrice = aDecoder.decodeObject(forKey: "lowest_sg_base_price") as? AnyObject
         lowestSgBasePriceGoodDeals = aDecoder.decodeObject(forKey: "lowest_sg_base_price_good_deals") as? AnyObject
         medianPrice = aDecoder.decodeObject(forKey: "median_price") as? AnyObject
         visibleListingCount = aDecoder.decodeObject(forKey: "visible_listing_count") as? AnyObject

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if eventCount != nil{
			aCoder.encode(eventCount, forKey: "event_count")
		}
		if averagePrice != nil{
			aCoder.encode(averagePrice, forKey: "average_price")
		}
		if dqBucketCounts != nil{
			aCoder.encode(dqBucketCounts, forKey: "dq_bucket_counts")
		}
		if highestPrice != nil{
			aCoder.encode(highestPrice, forKey: "highest_price")
		}
		if listingCount != nil{
			aCoder.encode(listingCount, forKey: "listing_count")
		}
		if lowestPrice != nil{
			aCoder.encode(lowestPrice, forKey: "lowest_price")
		}
		if lowestPriceGoodDeals != nil{
			aCoder.encode(lowestPriceGoodDeals, forKey: "lowest_price_good_deals")
		}
		if lowestSgBasePrice != nil{
			aCoder.encode(lowestSgBasePrice, forKey: "lowest_sg_base_price")
		}
		if lowestSgBasePriceGoodDeals != nil{
			aCoder.encode(lowestSgBasePriceGoodDeals, forKey: "lowest_sg_base_price_good_deals")
		}
		if medianPrice != nil{
			aCoder.encode(medianPrice, forKey: "median_price")
		}
		if visibleListingCount != nil{
			aCoder.encode(visibleListingCount, forKey: "visible_listing_count")
		}

	}

}
