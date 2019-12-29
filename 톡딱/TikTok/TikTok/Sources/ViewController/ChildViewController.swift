//
//  ChildViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/28.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ChildViewController: UIViewController, IndicatorInfoProvider {
    var childNumber: String = ""
    
    @IBOutlet weak var child: UILabel!
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
         return IndicatorInfo(title: "\(childNumber)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        child.text = childNumber
       

      
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
