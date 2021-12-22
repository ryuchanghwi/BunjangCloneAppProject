//
//  UserCorrectionResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/14.
//

import Foundation
struct UserCorrectionResponse : Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: String?
    
}


