//
//  APIServices.swift
//  study_Alamofire
//
//  Created by IJ . on 2019/11/10.
//  Copyright © 2019 ns. All rights reserved.
//

import Foundation

enum NetWorkResult<T, Error>{
    // T,Error 이 제네릭 Int가 들어오면 T가 인트
    case success(T)
    case failure(Error)
}
