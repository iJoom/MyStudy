//
//  ViewController.swift
//  study_Alamofire
//
//  Created by 남수김 on 2019/11/05.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var refreshControl = UIRefreshControl()
    
    var dataSet = [ReceiveData.ContentData]()
    //Cell에 들어갈 데이터저장배열
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *){
            self.tableView.refreshControl = refreshControl
        }else {
            self.tableView.addSubview(refreshControl)
        }
        refreshControl.attributedTitle = NSAttributedString(string : "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
     
        
        
        self.tableView.dataSource = self
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        downloadData()
    }
    
    @objc func refresh(){
        
        downloadData()
       
        self.refreshControl.endRefreshing()
        
    }

    func downloadData(){
        
        DataCommunication.shared.getDataList{
                   responseData in // a.b 구조체
                   
                   switch responseData{
                   case .success(let data) :// data가 b형(ContentData 배열
                       self.dataSet = data
                       self.tableView.reloadData() //reload
                       
                   case .failure(let Err) :
                       print(Err.localizedDescription)
                   }
                   
               }
        
    }
}


// MARK - 테이블뷰 설정
extension ViewController: UITableViewDataSource{
    
    //MARK 셀 개수설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSet.count
        
        
    }
    
    //MARK 셀 내용설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataTableViewCell else { return UITableViewCell() }
        
        cell.idLabel.text = "\(dataSet[indexPath.row].id)."
        cell.useridLabel.text = "\(dataSet[indexPath.row].userid)"
        cell.contentTextView.text = "\(dataSet[indexPath.row].content)"
        
        return cell
    }
    
    
}

