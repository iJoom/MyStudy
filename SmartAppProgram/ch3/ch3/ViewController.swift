//
//  ViewController.swift
//  ch3
//
//  Created by IJ . on 2020/10/23.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let title: String = sender.title(for: .selected)!
        
        let text = "\(title) button pressed"
        
        let styledText = NSMutableAttributedString(string: text)
        let attributes = [
            NSAttributedString.Key.font:
                UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)
        ]
        let nameRange = (text as NSString).range(of: title)
        styledText.setAttributes(attributes as [NSAttributedString.Key: Any], range: nameRange)
        statusLabel.attributedText = styledText
    }
    
    
}

