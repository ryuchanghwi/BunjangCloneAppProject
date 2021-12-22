//
//  AllAddressResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/16.
//

import Foundation
struct AllAddressResponse : Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: [AllAddressResult]
}

struct AllAddressResult: Decodable {
    var addressIdx: Int?
    var recipient: String?
    var phone: String?
    var latitude: String?
    var longitude: String?
    var roadName: String?
    var detailedAddress: String?
    var requestMsg: String?
    var status: String?
}
