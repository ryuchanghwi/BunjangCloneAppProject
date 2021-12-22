//
//  SelfLoginUserInfo.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/10.
//

import Foundation

struct SelfLoginUserInfo {
    static var loginEmail = ""
    static var loginPassword = ""
}

struct LoginResponse {
    static var ResponseState = false
    static var myUserIdx = 0
    static var ResponseEmail = ""
    static var ResponsePassword = ""
    static var myJWT = ""
}
