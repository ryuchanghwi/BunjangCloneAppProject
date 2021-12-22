//
//  SubCategoryResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/17.
//

import Foundation
struct SubCategoryResponse : Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result : SubCategoryResult
}

struct SubCategoryResult: Decodable {
    var subcategoryIdx: Int?
    var subcategoryName: String?
    var imgUrl: String?
    var goodsList : [goodsList]
}

struct goodsList : Decodable {
    var productIdx: Int?
    var imgUrl: String?
    var prices: Int?
    var productName: String?
    var areaName: String?
    var createdAt: String?
    var safepayment: String?
}
