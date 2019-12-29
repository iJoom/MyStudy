//
//  ChooseViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/27.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChooseViewController:  ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child1 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
        child1.childNumber = "인기여행지"
        
        let child2 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
        child2.childNumber = "Two2"
        
        let child3 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
        child3.childNumber = "Three"
        
        let child4 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
        child4.childNumber = "4444"
        
        let child5 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CityChooseTableVC") as! CityChooseTableViewController
        child5.childNumber = "유럽"
        
        let child6 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CityChooseTableVC") as! CityChooseTableViewController
        child6.childNumber = "동아시아"
        
        
        return [child1, child2, child3, child4, child5, child6]
    }
    
    @IBAction func touchUpBackButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden = false
        
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
