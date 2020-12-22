//
//  NameAndColorCell.swift
//  CH8 TableView
//
//  Created by IJ . on 2020/12/22.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    
    var name: String = "" {
        didSet {
            if (name != oldValue) {
                nameLabel.text = name
            }
        }
    }
    var color: String = "" {
        didSet {
            if (color != oldValue) {
                colorLabel.text = color
            }
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        let nameLabelRect = CGRect(x: 0, y: 5, width:70, height: 15)
//        let nameMarker = UILabel(frame: nameLabelRect)
//        nameMarker.textAlignment = NSTextAlignment.right
//        nameMarker.text = "Name:"
//        nameMarker.font = UIFont.boldSystemFont(ofSize: 12)
//        contentView.addSubview(nameMarker)
//        let colorLabelRect = CGRect(x: 0, y: 26, width:70, height: 15)
//        let colorMarker = UILabel(frame: colorLabelRect)
//        colorMarker.textAlignment = NSTextAlignment.right
//        colorMarker.text = "Color:"
//        colorMarker.font = UIFont.boldSystemFont(ofSize: 12)
//        contentView.addSubview(colorMarker)
//        let nameValueRect = CGRect(x: 80, y: 5, width:200, height: 15)
//        nameLabel = UILabel(frame: nameValueRect)
//        contentView.addSubview(nameLabel)
//        let colorValueRect = CGRect(x: 80, y: 25, width:200, height: 15)
//        colorLabel = UILabel(frame: colorValueRect)
//        contentView.addSubview(colorLabel)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
