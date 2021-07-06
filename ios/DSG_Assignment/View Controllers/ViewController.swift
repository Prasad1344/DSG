//
//  ViewController.swift
//  Prasadarao upputuri
//
//  Copyright © 2019 DSG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    lazy var datasource = GenericDataSource(viewController: self)
    var movieDetail: EventDetailVC?
    var popularMovies: [MovieEntity] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureData()
    }
}

fileprivate extension ViewController {
    
    func configureUI() {
        
        tblView.dataSource = datasource
        tblView.delegate = datasource
    }
    
    func configureData() {
        
        fetchEvents()
    }
    
    func fetchEvents() {
        
        showHud()
        MoviesManager.shared.getEventList { [weak self] response in
            
            dismissHud()
            self?.datasource.array = response
            self?.tblView.reloadData()
        } fail: { error in
            
            dismissHud()
            Helper.shared.ShowError(error.localizedDescription)
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        showHud()
        MoviesManager.shared.searchEvents(text: searchBar.text ?? "") { [weak self] response in
            
            dismissHud()
            self?.datasource.array = response
            self?.tblView.reloadData()
        } fail: { error in
            
            dismissHud()
            Helper.shared.ShowError(error.localizedDescription)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        view.endEditing(true)
        fetchEvents()
    }
}
