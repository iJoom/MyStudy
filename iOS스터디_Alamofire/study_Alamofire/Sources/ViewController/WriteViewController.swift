//
//  WirteViewController.swift
//  study_Alamofire
//
//  Created by 남수김 on 2019/11/05.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var useridTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var sendRequestButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        

        
    }
    
    func uiSet() {
        self.contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentTextView.layer.borderWidth = 1.0
        self.contentTextView.layer.cornerRadius = 20
        self.sendRequestButton.layer.cornerRadius = 15
    }
    
    //통신버튼 클릭시
    @IBAction func sendRequestButtonClick(_ sender: Any) {
        
        
        guard let qId = questionTextField.text else {return}
        guard let userId = useridTextField.text else {return}
        guard let content = contentTextView.text else {return}
        
        
        
        DataPost.shared.postDataList(Int(qId) ?? 0, userId  ,content){
            
            responseData in
            
            switch responseData{
                
            case .success(let data) :
                
//                let user_data = data as! ReceiveData
//
//                UserDefaults.standard.set(user_data.qId, forKey: "qId")
//                UserDefaults.standard.set(user_data.userid, forKey: "userid")
//                UserDefaults.standard.set(user_data.content, forKey: "content")
                
                print("데이터 추가성공")
                print(data)
                
                
                
                
                
                
                
                
            case .failure(let Err) :
                print("실패")
                print(Err.localizedDescription)
                
            }
            
            
        }
        
    }
}
