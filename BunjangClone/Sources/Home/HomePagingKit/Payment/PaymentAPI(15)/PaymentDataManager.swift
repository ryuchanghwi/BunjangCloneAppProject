//
//  PaymentDataManager.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/16.
//

import Foundation
import Alamofire
import UIKit

class PaymentDataManager {
    func paymentPostData(UserIdx: Int, _ viewController: SelfPaymentViewController, parameters : PaymentInfo) {


        //HTTP Method: Post
        AF.request("https://knockit.life/app/purchases/\(UserIdx)",
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: nil)
            .validate()
            .responseDecodable(of: PaymentResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("DEBUG >> Success \(response)")

                case .failure(let error):
                    print("DEBUG >> Get Error: \(error.localizedDescription)")

                }

            }
    }
}

class PaymentDetailGoodsRequest {
    func PaymentDetailGoodsData(productIdxValue: Int, _ viewController: SelfPaymentViewController) {
        let url = "https://knockit.life/app/products/\(productIdxValue)"
        
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
                    print("DEBUG >> PaymentDetailGoods Response \(response)")
                    viewController.didPaymentDetailGoodsCalled(response)
                case .failure(let error):
                    print("DEBUG >> PaymentDetailGoods Error: \(error.localizedDescription)")
                }
            }
    }
}

