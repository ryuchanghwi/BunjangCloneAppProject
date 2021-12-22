//
//  PaymentInfo.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/16.
//

import Foundation

struct PaymentInfo: Encodable {
    static var productIdx: Int = 0
    static var addressIdx: Int = 0
    static var requestMsg: String = ""
    static var purchaseType : String = ""
    static var points: Int = 0
}
