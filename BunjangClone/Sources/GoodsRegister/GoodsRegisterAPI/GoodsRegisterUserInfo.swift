//
//  GoodsRegisterUserInfo.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/12.
//

import Foundation

    // MARK: - Welcome
    struct GoodsRegisterUserInfo: Encodable {
        var productName: String
        var subcategoryIdx: Int
        var content: String
        var prices: Int
        var freeShipping, negotiable: String
        var quantity: Int
        var conditions, changes: String

        var imgList: [ImgList]?
        var tagList: [TagList]?
    }

    // MARK: - ImgList
    struct ImgList: Encodable {
        var imgURL: String?


    }

    // MARK: - TagList
    struct TagList: Encodable {
        var tagName: String?
    }
