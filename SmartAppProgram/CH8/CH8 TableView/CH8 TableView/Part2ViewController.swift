//
//  Part2ViewController.swift
//  CH8 TableView
//
//  Created by IJ . on 2020/12/22.
//

import UIKit

class Part2ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellTableIdentifier = "CellTableIdentifier"
    
    let computers = [
    ["Name" : "MacBook Air", "Color" : "Silver"],
    ["Name" : "MacBook Pro", "Color" : "Silver"],
    ["Name" : "iMac", "Color" : "Silver"],
    ["Name" : "Mac Mini", "Color" : "Silver"],
    ["Name" : "Mac Pro", "Color" : "Black"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(NameAndColorCell.self,
        forCellReuseIdentifier: cellTableIdentifier)
        
        let xib = UINib(nibName: "NameAndColorCell", bundle: nil)
        tableView.register(xib,
        forCellReuseIdentifier: cellTableIdentifier)
        tableView.rowHeight = 65
    }
    

}


extension Part2ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
        withIdentifier: cellTableIdentifier, for: indexPath)
        as! NameAndColorCell
        let rowData = computers[indexPath.row]
        cell.name = rowData["Name"]!
        cell.color = rowData["Color"]!
        return cell
    }
    
    
    
}
