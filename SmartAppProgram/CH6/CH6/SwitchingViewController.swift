//
//  SwitchingViewController.swift
//  CH6
//
//  Created by IJ . on 2020/10/30.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {

    private var blueViewController: BlueViewController!
    private var yellowViewController: YellowViewController!
    
    var testVar: String? = nil
    let a: Optional<Int> = Int("ㅁ")
    let testView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue")
            as! BlueViewController
        blueViewController.view.frame = view.frame
        switchViewController(from: nil, to: blueViewController)
        
        print(a)
        
        testView.contentHuggingPriority(for: .horizontal)
        testView.setContentHuggingPriority(UILayoutPriority(rawValue: 980), for: .horizontal)
        testView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            
            DispatchQueue.global().async {
                
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("asdf")
    }
    private func switchViewController(from fromVC:UIViewController?,
                                      to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMove(toParent: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParent()
        }
        if toVC != nil {
            self.addChild(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParent: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        if blueViewController != nil
            && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if yellowViewController != nil
            && yellowViewController!.view.superview == nil {
            yellowViewController = nil
        }
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                yellowViewController =
                    storyboard?.instantiateViewController(withIdentifier: "Yellow")
                    as! YellowViewController
            }
        } else if blueViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController =
                    storyboard?.instantiateViewController(withIdentifier: "Blue")
                    as! BlueViewController
            }
        }
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        
        // Switch view controllers
        if blueViewController != nil
            && blueViewController!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight,
                                          for: view, cache: true)
            UIView.transition(from: blueViewController.view, to: yellowViewController.view, duration: 0.4, options: .transitionFlipFromRight, completion: nil)
            yellowViewController.view.frame = view.frame
            switchViewController(from: blueViewController,
                                 to: yellowViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft,
                                          for: view, cache: true)
            UIView.transition(from: yellowViewController.view   , to: blueViewController.view, duration: 0.4, options: .transitionFlipFromLeft, completion: nil)
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewController,
                                 to: blueViewController)
        }
    }
    


}
