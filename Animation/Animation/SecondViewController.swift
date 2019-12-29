//
//  SecondViewController.swift
//  Animation
//
//  Created by IJ . on 2019/12/25.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var airPlane: UIImageView!
    
    var animationDuration: TimeInterval = 1.5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        // Do any additional setup after loading the view.
    }
    
    private func setupGesture() {
          let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
          view.addGestureRecognizer(tap)
      }
    
    
    @objc func handleTap() {
       
        animate2()
        
        // 둘중 하나 flag == false ? animate() : animate2()
    }
    
    
    func animate2() {
             UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                        self.airPlane.alpha = 0
                        self.airPlane.transform =
                           self.airPlane.transform.translatedBy(x: 100, y: -200)
                    }  )
           //비행기 오른쪽 대각선
           
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
