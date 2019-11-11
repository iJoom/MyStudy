//
//  receiveData.swift
//  study_Alamofire
//
//  Created by IJ . on 2019/11/07.
//  Copyright © 2019 ns. All rights reserved.
//

import Foundation


struct ReceiveData: Codable{
    
    let result: Int
    let data: [ContentData]
    
    struct ContentData: Codable {
        
        let id: Int
        let qId: Int
        let userid: String
        let time: String
        let content: String
        
        enum CodingKeys: String, CodingKey {
            
            case id
            case qId = "question_id"
            case userid, time, content
            
            
        }
        
    }
    
    
}
