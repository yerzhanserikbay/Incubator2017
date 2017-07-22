//
//  ViewController.swift
//  Candy Search
//
//  Created by YERZHAN SERIKBAY on 6/14/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
class Candy {
        var name = String()
        var nameOfFactory = String()
        init(name: String, nameOfFactory: String) {
            self.name = name
            self.nameOfFactory = nameOfFactory
            }
    }
let candies = [
        Candy(name: "Aigerim", nameOfFactory: "Rakhat"),
        Candy(name: "Aitys", nameOfFactory: "Rakhat"),
        Candy(name: "Balapan", nameOfFactory: "Rakhat"),
        Candy(name: "Bayan Sulu", nameOfFactory: "Bayan Sulu"),
        Candy(name: "Chokonilla", nameOfFactory: "Roshen"),
        Candy(name: "Gulder", nameOfFactory: "Rakhat"),
        Candy(name: "Jelly", nameOfFactory: "Bayan Sulu"),
        Candy(name: "Konafetto", nameOfFactory: "Roshen"),
        Candy(name: "Korovka", nameOfFactory: "Roshen"),
        Candy(name: "Mars", nameOfFactory: "Imported"),
        Candy(name: "Milky Splash", nameOfFactory: "Roshen"),
        Candy(name: "Qyzyl Tan", nameOfFactory: "Rakhat"),
        Candy(name: "Qostanay", nameOfFactory: "Bayan Sulu"),
        Candy(name: "Rafaello", nameOfFactory: "Imported"),
        Candy(name: "Rubbin", nameOfFactory: "Bayan Sulu"),
        Candy(name: "Snickers", nameOfFactory: "Imported"),
        Candy(name: "Twix", nameOfFactory:"Imported")
    ]
    //SEARCH
    var filteredCandies = [Candy]()
    
    let searchControl = UISearchController(searchResultsController: nil)
    var filter = String()
    

    //FILTER
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredCandies = candies.filter { candy in
            let categoryMatch = (scope == "All") || (candy.nameOfFactory == scope)
            return categoryMatch && candy.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    //SEGMENTED
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        //SEARCH 
//        searchControl.delegate = self
//        searchControl.searchBar.delegate = self
       
        
        searchControl.searchResultsUpdater = self
        searchControl.dimsBackgroundDuringPresentation = false
        searchControl.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        self.tableView.tableHeaderView = searchControl.searchBar

        
        searchControl.searchBar.scopeButtonTitles = [
        "All",
        "Bayan Sulu",
        "Rakhat",
        "Roshen",
        "Imported"
        ]
        searchControl.searchBar.delegate = self
            }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchControl.isActive && searchControl.searchBar.text != "" {
            return filteredCandies.count
        }
        return candies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIndetifier", for: indexPath)
        let candy: Candy
        if searchControl.isActive && searchControl.searchBar.text != "" {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.nameOfFactory
        return cell
    }
}




//MARK: SEARCH

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
    }

}
