//
//  GenersCollectionCell.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 29/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation
import UIKit

class GenersCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var lblGeners: UILabel!
    
    weak var object: GenreEntity?
    
    override func configureUI(_ model: Any, indexpath: IndexPath? = nil, viewController: UIViewController? = nil) {
        
        object = model as? GenreEntity
        
        lblGeners.text = object?.name.uppercased()
    }
}
