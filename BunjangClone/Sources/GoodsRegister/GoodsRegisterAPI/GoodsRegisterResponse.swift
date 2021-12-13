//
//  GoodsRegisterResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/12.
//

import Foundation

struct GoodsRegisterResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var result: GoodsRegisterResponseResult?
}

struct GoodsRegisterResponseResult: Decodable {
    var productIdx: Int?
}
