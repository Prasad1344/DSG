//
//  MovieEntity.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 26/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation
import UIKit

class MovieEntity : NSObject {

	var adult : Bool!
	var backdropPath : String!
    var genres : [GenreEntity]?
	var id : Int!
	var originalLanguage : String!
	var originalTitle : String!
	var overview : String!
	var popularity : Double!
	var posterPath : String!
	var releaseDate : String!
	var title : String!
	var video : Bool!
	var voteAverage : Double!
	var voteCount : Int!
    var runtime : Int?


	init(fromDictionary dictionary: [String:Any]) {
        
        super.init()
		modifyObject(dictionary)
	}
    
    func modifyObject(_ dictionary: [String:Any]) {
        
        adult = dictionary["adult"] as? Bool
        backdropPath = dictionary["backdrop_path"] as? String
        id = dictionary["id"] as? Int
        originalLanguage = dictionary["original_language"] as? String
        originalTitle = dictionary["original_title"] as? String
        overview = dictionary["overview"] as? String
        popularity = dictionary["popularity"] as? Double
        posterPath = dictionary["poster_path"] as? String
        releaseDate = dictionary["release_date"] as? String
        title = dictionary["title"] as? String
        video = dictionary["video"] as? Bool
        voteAverage = dictionary["vote_average"] as? Double
        voteCount = dictionary["vote_count"] as? Int
        runtime = dictionary["runtime"] as? Int
        
        if let genresArray = dictionary["genres"] as? [[String:Any]]{
            genres = [GenreEntity]()
            for dic in genresArray{
                let value = GenreEntity(fromDictionary: dic)
                genres?.append(value)
            }
        }
    }
    
	func toDictionary() -> [String:Any] {
        
		var dictionary = [String:Any]()
		if adult != nil{
			dictionary["adult"] = adult
		}
		if backdropPath != nil{
			dictionary["backdrop_path"] = backdropPath
		}
		if id != nil{
			dictionary["id"] = id
		}
		if originalLanguage != nil{
			dictionary["original_language"] = originalLanguage
		}
		if originalTitle != nil{
			dictionary["original_title"] = originalTitle
		}
		if overview != nil{
			dictionary["overview"] = overview
		}
		if popularity != nil{
			dictionary["popularity"] = popularity
		}
		if posterPath != nil{
			dictionary["poster_path"] = posterPath
		}
		if releaseDate != nil{
			dictionary["release_date"] = releaseDate
		}
		if title != nil{
			dictionary["title"] = title
		}
		if video != nil{
			dictionary["video"] = video
		}
		if voteAverage != nil{
			dictionary["vote_average"] = voteAverage
		}
		if voteCount != nil{
			dictionary["vote_count"] = voteCount
		}
        if genres != nil{
            var dictionaryElements = [[String:Any]]()
            for genresElement in genres ?? [] {
                dictionaryElements.append(genresElement.toDictionary())
            }
            dictionary["genres"] = dictionaryElements
        }
        if runtime != nil{
            dictionary["runtime"] = runtime
        }
		return dictionary
	}
    
    override func getCellIdentifier(_ type: cellType) -> String {
        return String(describing: EventCell.self)
    }
    
    override func getCellSize() -> CGSize {
        return CGSize(width: 106, height: 160)
    }
}
