//
//  GenericDataSource.swift
//  Prasadarao upputuri
//
//  Created by Prasadarao upputuri on 26/06/21.
//  Copyright © 2021 DSG. All rights reserved.
//

import Foundation
import UIKit

protocol GenericDataSourceProtocol: AnyObject {
    func tableDidScroll(_ scrollView : UIScrollView)
}

class GenericDataSource : NSObject {
    
    weak var delegate: GenericDataSourceProtocol?
    var array: [Any]?
    private var tblView: UITableView?
    
    fileprivate weak var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    fileprivate func loadCell(atIndexPath indexPath: IndexPath, forTableView tableView: UITableView) -> UITableViewCell? {
        
        guard let object = array?.getElement(indexPath.row) as? NSObject else {
            return nil
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: object.getCellIdentifier(.table), for: indexPath)
        
        cell.configureUI(object, indexpath: indexPath, viewController: viewController)
        return cell
    }
}

extension GenericDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.loadCell(atIndexPath: indexPath, forTableView: tableView) ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
    }
}

extension GenericDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        if let object = array?.getElement(indexPath.row) {
            cell?.cellDidSelect(tableView, object, indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let object = array?.getElement(indexPath.row) {
            cell.cellWillDisplay(tableView, object, indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.cellDidEndDisplay(array?.getElement(indexPath.row), indexPath: indexPath)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.tableDidScroll(scrollView)
    }
}
