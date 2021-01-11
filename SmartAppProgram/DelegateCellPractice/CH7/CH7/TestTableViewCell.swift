//
//  TestTableViewCell.swift
//  CH7
//
//  Created by IJ . on 2020/12/17.
//

import UIKit

protocol DeleteButtonDelegate: AnyObject{
    func shouldTouchDeleteButton(at indexPath: IndexPath)
    
    func interestCell(at cell: TestTableViewCell, didTapClickBookMarkButton: UIButton)
    
    
}

Optional<Int>


class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var deleteButton: UIButton!
    weak var delegate: DeleteButtonDelegate?
    
    var indexPath2: IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func touchUpDeleteButton(_ sender: UIButton) {
        
//        if let superView = self.superview as? UITableView {
//            print("cell sender indexPath 값: \(indexPath2)")
//            
//            let indexPath = superView.indexPath(for: self)
//            print(indexPath)
//            
//            self.delegate?.shouldTouchDeleteButton(at: indexPath!)
//        } else {
//            print("superview is not a UITableView - getIndexPath")
//        }
        
        self.delegate?.interestCell(at: self,didTapClickBookMarkButton: sender)
       
    }
}
