//
//  SelfLoginResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/10.
//

import Foundation

struct SelfLoginResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: ResponseResult?

}

struct ResponseResult: Decodable {
    var userIdx: Int?
    var jwt: String?
}


