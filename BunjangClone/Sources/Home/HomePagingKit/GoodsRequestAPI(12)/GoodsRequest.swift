//
//  GoodsRequest.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/14.
//

import Foundation
import UIKit
import Alamofire

class GoodsRequest {
    func GoodsData(_ viewController: HomeRecomemedGoodsViewController) {
        let url = "https://knockit.life/app/products"
        var myJWToken : String = ""
        myJWToken = UserDefaults.standard.value(forKey: "myJWT") as? String ?? ""
        
        
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["X-ACCESS-TOKEN" : myJWToken])
            .validate()
            .responseDecodable(of: GoodsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("DEBUG>> Success \(response)")
                    viewController.didRetrieveGoods(response)
                    
                case .failure(let error):
                    print("DEBUG >> Error: \(error)")
                }
            }
    }
}
