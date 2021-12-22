//
//  DetailGoodsResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/15.
//

import Foundation
struct DetailGoodsResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: detailGoodsResult?
}
struct detailGoodsResult : Decodable {
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
    var imgList: [detailImgList]?
    var tagList: [detailTagList]?
}

struct detailImgList: Decodable {
    var productImgIdx: Int?
    var productIdx: Int?
    var imgUrl: String?
}

struct detailTagList: Decodable {
    var productTagIdx: Int?
    var productIdx: Int?
    var tagName: String?
}
