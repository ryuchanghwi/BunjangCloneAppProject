//
//  StoreSettingRequest.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit
import Alamofire

class StoreSettingRequest {

    func getStoreSettingData(IdxVaule: Int, _ viewContrller: StoreSettingViewController) {
        
        
        var myJWToken : String = ""
        myJWToken = UserDefaults.standard.value(forKey: "myJWT") as? String ?? ""

        
        //HTTP Method: Get
        AF.request("https://knockit.life/app/users/\(IdxVaule)",
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: [
                    "X-ACCESS-TOKEN" : myJWToken])
            .validate()
            .responseDecodable(of: StoreSettingResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("DEBUG>> StoreSetting Response \(response)")
                    viewContrller.didSuccess(response)
                    
                    
                    
                    
                case .failure(let error):
                    print("DEBUG>> StoreSetting Get Error: \(error.localizedDescription)")
                }
            }
    }
}
