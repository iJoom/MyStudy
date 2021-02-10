//
//  WriteViewController.swift
//  FeatureWrite
//
//  Created by IJ . on 2021/02/10.
//

import UIKit

public class WriteViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var testTableView: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        testView.startAnimating()
        testTableView.startAnimating()
    }
    
}
