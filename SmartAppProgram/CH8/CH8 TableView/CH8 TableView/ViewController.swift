//
//  ViewController.swift
//  CH8 TableView
//
//  Created by IJ . on 2020/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let dwarves = [
    "Sleepy", "Sneezy", "Bashful", "Happy",
    "Doc", "Grumpy", "Dopey",
    "Thorin", "Dorin", "Nori", "Ori",
    "Balin", "Dwalin", "Fili", "Kili",
    "Oin", "Gloin", "Bifur", "Bofur",
        "Bombur" ]
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }


}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dwarves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (cell == nil) {
        cell = UITableViewCell(
            style: UITableViewCell.CellStyle.default,
        reuseIdentifier: simpleTableIdentifier)
        }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr Tolkien"
        }
       
       
        
        
        cell?.textLabel?.text = dwarves[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController(title: "Row Selected",
                                           message: message, preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Yes I Did",style: .default, handler: nil)
        
        controller.addAction(action)
        
        
        
        
        present(controller, animated: true, completion: nil)
    }
    
}
