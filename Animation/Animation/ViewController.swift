//
//  ViewController.swift
//  Animation
//
//  Created by IJ . on 2019/11/28.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var flag : Bool = false
    var animationDuration: TimeInterval = 1.5
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        helloLabel.alpha = 0
        introLabel.alpha = 0
        nameLabel.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupGesture()
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //
    //
    //    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        guard flag else {
               animate()
            flag = true
            return
        }
        animate2()
        
        // 둘중 하나 flag == false ? animate() : animate2()
    }
    func animate() {
        UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveLinear, animations: {
                   self.helloLabel.alpha = 1
                   self.helloLabel.transform =
                   CGAffineTransform.init(translationX: -100, y: 0)
               }  )
        UIView.animate(withDuration: animationDuration, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                    self.introLabel.alpha = 1
                    self.introLabel.transform =
                    CGAffineTransform.init(translationX: -100, y: 0)
                }  )
               UIView.animate(withDuration: animationDuration, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                    self.nameLabel.alpha = 1
                    self.nameLabel.transform =
                    CGAffineTransform.init(translationX: -100, y: 0)
                }  )
    }
    
    func animate2() {
          UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                     self.helloLabel.alpha = 0
                     self.helloLabel.transform =
                        self.helloLabel.transform.translatedBy(x: 100, y: -200)
                 }  )
        //비행기 오른쪽 대각선
        UIView.animate(withDuration: animationDuration, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                      self.introLabel.alpha = 0
                      self.introLabel.transform =
                    self.introLabel.transform.translatedBy(x: 0, y: -200)
                  }  )
                 UIView.animate(withDuration: animationDuration, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                      self.nameLabel.alpha = 0
                      self.nameLabel.transform =
                   self.nameLabel.transform.translatedBy(x: 0, y: -200)
                  }  )
        
        
      }
 

}

