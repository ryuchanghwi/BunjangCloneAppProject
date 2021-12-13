//
//  StoreSettingResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
struct StoreSettingResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: StoreSettingResult?
}

struct StoreSettingResult: Decodable {
    var userIdx: Int?
    var profile: String?
    var storeName: String?
    var storeAddress: String?
    var contactableFrom: String? //이따 string으로
    var contactableTo: Date?
    var storeIntro: String?
    var tradePoliy: String?
    var flag: String?
    
}
