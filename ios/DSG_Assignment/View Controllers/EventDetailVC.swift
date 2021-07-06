//
//  MovieDetailVC.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 28/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class EventDetailVC: UIViewController {
    
    @IBOutlet weak var imgViewPoster: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    var object: EventEntity?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @IBAction func closeClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

fileprivate extension EventDetailVC {
    
    func configureUI() {
        
        if let posterUrl = object?.performers.first?.image, let url = URL(string: posterUrl) {
            imgViewPoster.kf.setImage(with: url)
        }
        lblName.text = object?.title
        lblDate.text = object?.localDate
        lblLocation.text = object?.venue.displayLocation
    }
}
