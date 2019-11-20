//
//  DataPost.swift
//  study_Alamofire
//
//  Created by IJ . on 2019/11/10.
//  Copyright © 2019 ns. All rights reserved.
//

import Foundation
import Alamofire

class DataPost {
    
    private init(){}
    
    static let shared = DataPost() //싱글턴
    
    func postDataList(_ question: Int,_ userid: String,_ content:String ,completion: @escaping (NetWorkResult<NewData, Error>) -> Void) {
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [
            "question": question,
            "userid": userid,
            "content": content
        ]
        let URL = BaseURL.newURL
        

        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                
                
                //                print("request", response.request)
                //                print("response", response.response)
                //                print("data", response.data)
                //                print("result", response.result)
                
                // parameter 위치
                switch response.result {
                    
                // 통신 성공 - 네트워크 연결
                case .success:
                    if let value = response.result.value {
                        
                        if let status = response.response?.statusCode {
                            
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    print("value", value)
                                    let result = try decoder.decode(NewData.self, from: value)
                                    
                                    // newurl 서버에서 통신 결과 값만 디코딩하면 되므로 기존의 구조체가 아닌 NewData구조체로 디코딩
                                    
                                
                                    if result.result == 200{
                                        print("success")
                                        completion(.success(result))
                                
                                        
                                    }else {
                                        completion(.failure(fatalError("서버이상")))
                                    }
                                }
                                catch(let err){
                              
                                    print(err.localizedDescription)
                                    completion(.failure(err))
                                }
                     
                            default:
                                break
                            }// switch
                        }// iflet
                    }
                    break
                // 통신 실패 - 네트워크 연결
                case .failure(let err): //err변수, 다양한 서버 err잡을려고
                    
                    print(err.localizedDescription)
                    print("DataPost 통신 실패")
                    // .networkFail이라는 반환 값이 넘어감
                    break
                } // response.result switch
        } // alamofire.request
        
        
        
    }
    
    
    
    
    
    
}



    

