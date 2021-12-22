//
//  AddressRegisterResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/15.
//

import Foundation
struct AddressRegisterResponse : Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result : addressRegisterResult
}

struct addressRegisterResult : Decodable {
    var addressIdx : Int?
}
