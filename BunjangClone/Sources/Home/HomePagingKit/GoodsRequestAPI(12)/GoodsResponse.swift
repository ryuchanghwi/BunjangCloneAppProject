//
//  GoodsResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/14.
//

import Foundation
struct GoodsResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: [goodsResult]
}

struct goodsResult : Decodable {
    var productIdx: Int?
    var prices: Int?
    var productName: String?
    var areaName: String?
    var createdAt: String?
    var safePayment: String?
    var cntLikes: Int?
    var conditions: String?
    var freeShipping: String?
    var negotiable: String?
    var changes: String?
    var quantity: Int?
    var content: String?
    var subcategoryName: String?
    var storeName: String?
    var cntFollowers: Int?
    var avgScores: Int?
    var statusLike: String?
    var imgList: [imgList]?
    var tagList: [tagList]?
}

struct imgList: Decodable {
    var productImgIdx: Int?
    var productIdx: Int?
    var imgUrl: String?
}

struct tagList: Decodable {
    var productTagIdx: Int?
    var productIdx: Int?
    var tagName: String?
}
