//
//  Part3ViewController.swift
//  CH8 TableView
//
//  Created by IJ . on 2020/12/22.
//

import UIKit

class TestNIL: ExpressibleByNilLiteral {
    required init(nilLiteral: ()) {
        
    }
    
    var A: Int = 5
}

class Part3ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var names: [String: [String]]!
    var keys: [String]!
    
    var ab = TestNIL(nilLiteral: ())
    var testing: Int?
    
    
    var searchController: UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(ab.A)
        ab = nil
        print(ab.A)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self,
        forCellReuseIdentifier: sectionsTableIdentifier)
        let path = Bundle.main.path(forResource:
        "sortednames", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = namesDict as! [String: [String]]
        keys = (namesDict!.allKeys as! [String]).sorted()
        
        
        let resultsController = SearchResultsController()
        resultsController.names = names
        resultsController.keys = keys
        searchController =
        UISearchController(searchResultsController: resultsController)
        let searchBar = searchController.searchBar
        searchBar.scopeButtonTitles = ["All", "Short", "Long"]
        searchBar.placeholder = "Enter a search term"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultsController
    }

}


extension Part3ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for:
        indexPath)
        as UITableViewCell
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        return cell
    }
    
    
}
