//
//  ExtensionShimmer.swift
//  FeatureWrite
//
//  Created by IJ . on 2021/02/10.
//

import UIKit

extension UIView {
    
    
    
    func addGradientLayer() -> CAGradientLayer {
        
        let gradientColorOne : CGColor = UIColor(white: 0.85, alpha: 1.0).cgColor
        let gradientColorTwo : CGColor = UIColor(white: 0.95, alpha: 1.0).cgColor
        
        
        let gradientLayer = CAGradientLayer()
        
        
        
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        //rotate shimmer
        //        let angle = 45 * CGFloat.pi / 180
        //        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        gradientLayer.colors = [gradientColorOne,gradientColorTwo,gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        
        self.layer.addSublayer(gradientLayer)
//                self.layer.mask = gradientLayer.mask
        
        return gradientLayer
    }
    
    func addAnimation() -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        
        
        //animation.repeatCount = .infinity
        animation.repeatCount = 1.5
        animation.duration = 0.9
        
        return animation
    }
    
    func startAnimating() {
        
        let gradientLayer = addGradientLayer()
        let animation = addAnimation()
        
        
        
        gradientLayer.add(animation, forKey: animation.keyPath)
    }
    
}
