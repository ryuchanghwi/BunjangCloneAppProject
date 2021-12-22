//
//  PaymentResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/16.
//

import Foundation
struct PaymentResponse : Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: paymentResult?
}

struct paymentResult: Decodable {
    var purchaseIdx: Int?
}
