//
//  DataCommunication.swift
//  study_Alamofire
//
//  Created by IJ . on 2019/11/07.
//  Copyright © 2019 ns. All rights reserved.
//

import Foundation
import Alamofire



class DataCommunication {
    
    private init(){}
    
    static let shared = DataCommunication()
    
    func getDataList(completion: @escaping (NetWorkResult<[ReceiveData.ContentData], Error>) -> Void) {
        //받아 올떄 조건 없으므로 @escaping 클로저 바로
        //ReceiveData.ContentData 구조체 T가 티위치
        //Error는 타입
        
        let URL = BaseURL.ReceiveURL
        Alamofire.request(URL).responseJSON{ //중괄호 열고 클로저 함수를 써먹는거임
            response in
           // response.response?.statusCode
            
            switch response.result {
                
            case .success: // result 의 success 와 failure
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    
                    let object =  try decoder.decode(ReceiveData.self, from: data)
                    
                    if object.result == 200{ //200나오면 통신 성공
                        print("성공")
                        completion(.success(object.data))
                    }else {
                        completion(.failure(fatalError("서버이상")))
                        
                    }
                    
                } catch(let err){
                    print(err.localizedDescription)
                    completion(.failure(err))
                    
                }
                
            case .failure(let err):
                print(err.localizedDescription)
                
            }
            
            
        }
        
        
        
        
        
    }
    
}
