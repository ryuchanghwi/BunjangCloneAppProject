//
//  LocationResponse.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/09.
//

import Foundation
import Alamofire


    struct LocationResponse: Decodable {
        var lastBuildDate : String?
        var total : Int?
        var start : Int?
        var display : Int?
        var items : [items]
    }

    struct items: Decodable {
        var title: String?
        var lint: String?
        var category: String?
        var description: String?
        var telephone: String?
        var address: String? 
        var roadAddress: String?
        var mapx: String?
        var mapy: String?
        
    }


struct LocationResult {
    static var LocationSearchState = false
}
