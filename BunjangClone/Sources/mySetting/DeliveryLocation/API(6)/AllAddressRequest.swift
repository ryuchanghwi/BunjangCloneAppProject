//
//  AllAddressRequest.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/16.
//

import Foundation
import UIKit
import Alamofire

class AllAddressRequest {
    func getAllAddressData(IdxValue : Int, viewController: DeliveryTableVC) {
        let url = "https://knockit.life/app/users/\(IdxValue)/addresses"
        
        
        var myJWToken : String = ""
        myJWToken = UserDefaults.standard.value(forKey: "myJWT") as? String ?? ""
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["X-ACCESS-TOKEN" : myJWToken])
            .validate()
            .responseDecodable(of: AllAddressResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("DEBUG >> ALLAddress Response \(response)")
                    viewController.didSuccess(response)
                case .failure(let error):
                    print("DEBUG >> AllAddress Error: \(error.localizedDescription)")
                }
            }
        
    }
}

