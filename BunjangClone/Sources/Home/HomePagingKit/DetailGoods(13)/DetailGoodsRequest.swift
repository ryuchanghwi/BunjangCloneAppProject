//
//  DetailGoodsRequest.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/15.
//

import Foundation
import UIKit
import Alamofire

class DetailGoodsRequest {
    func DetailGoodsData(productIdxValue: Int, _ viewController: DetailGoodsViewController) {
        let url = "https://knockit.life/app/products/\(productIdxValue)"
        //idx prodictIdx 값 prodictIdxValie
        
        var myJWToken : String = ""
        myJWToken = UserDefaults.standard.value(forKey: "myJWT") as? String ?? ""
        
        //HTTP Method: Get
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["X-ACCESS-TOKEN" : myJWToken])
            .validate()
            .responseDecodable(of: DetailGoodsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("DEBUG >> GoodsDetail Response \(response)")
                    viewController.didDetailGoodsCalled(response)
                    
                case .failure(let error):
                    print("DEBUG >> GoodsDetail Error: \(error.localizedDescription)")
                }
            }
    }
}
