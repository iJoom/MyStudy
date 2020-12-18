//
//  ViewController.swift
//  CH7
//
//  Created by IJ . on 2020/12/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testTableView: UITableView!
    
    class bb {
        func printff() {
          print("asdf")
        }
    }
    var rowCount: Int = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testTableView.delegate = self
        testTableView.dataSource = self
        
      
    }


}


extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! TestTableViewCell
        cell.delegate = self
        
    
        return cell
    }
    
    
}

extension ViewController: DeleteButtonDelegate {
    func shouldTouchDeleteButton(at cell: TestTableViewCell) {
        
        let indexPath = testTableView.indexPath(for: cell)
        print("델리게이트 indexPath값 \(indexPath)")
       
        if let indexPaths = indexPath {
            rowCount -= 1
            self.testTableView.deleteRows(at: [indexPaths], with: .fade)
        }
        
    }
    
    
    
    func shouldTouchDeleteButton(at indexPath: IndexPath) {
        
//        print("뷰컨 indexPath값 \(indexPath)")
//        rowCount -= 1
//        self.testTableView.deleteRows(at: [indexPath], with: .fade)
       //numberOfRowInSection 업데이트가 먼저되고 delete되야 쓰레드 에러 발생 X
        
    }
    
    
    
    
}
