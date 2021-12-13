//
//  SelfSignInResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/10.
//

import Foundation
struct SelfSignInResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: result?
}

struct result: Decodable {
    var jwt: String?
    var userIdx: Int?
}
