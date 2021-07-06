//
//  MovieCell.swift
//  Prasadarao upputuri
//
//  Copyright © 2019 DSG. All rights reserved.
//

import UIKit
import Kingfisher

class EventCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    
    var object: EventEntity?
    weak var controller: ViewController?
    let formatter = DateFormatter()
    let formatterUTC = DateFormatter()
    
    override func configureUI(_ model: Any, indexpath: IndexPath? = nil, viewController: UIViewController? = nil) {
        
        object = model as? EventEntity
        controller = viewController as? ViewController
        
        title.text = object?.title
        lblLocation.text = object?.venue.displayLocation
        
        if let posterUrl = object?.performers.first?.image, let url = URL(string: posterUrl) {
            poster.kf.setImage(with: url)
        }
        
        if let date = object?.localDate {
            
            lblDate.text = date
        } else if let utcDate = object?.datetimeUtc {
            
            formatterUTC.locale = Locale(identifier: "en_US_POSIX")
            formatterUTC.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            formatter.timeZone = .current
            formatter.dateFormat = "E, dd MMM yyyy h:mm a"
            lblDate.text = formatter.string(from: formatterUTC.date(from: utcDate)!)
            object?.localDate = lblDate.text
        }
    }
    
    override func cellDidSelect(_ tableView: UITableView? = nil, _ model: Any, _ indexpath: IndexPath? = nil) {
        
        if let movieDetail = NavigationManager.shared.getController(.movieDetail) as? EventDetailVC {
            
            movieDetail.object = object
            self.controller?.navigationController?.pushViewController(movieDetail, animated: true)
        }
    }
}
