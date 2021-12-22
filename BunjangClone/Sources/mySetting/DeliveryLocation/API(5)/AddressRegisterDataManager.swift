//
//  AddressRegisterDataManager.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/15.
//

import Foundation
import UIKit
import Alamofire
class AddressRegisterDataManager {
    func userAddressRegisterPostData(UserIdx : Int, viewController: DeliveryAddViewController) {
        let params = ["recipient" : AddressRegisterInfo.recipient,
                      "phone" : AddressRegisterInfo.phone,
                      "latitude" : AddressRegisterInfo.latitude,
                      "longitude" : AddressRegisterInfo.longitude,
                      "roadName" : AddressRegisterInfo.roadname,
                      "detailedAddress" :AddressRegisterInfo.detailedAddress,
                      "requestMsg" : AddressRegisterInfo.requestMsg,
                      "status" : AddressRegisterInfo.status]
        
        var myJWToken : String = ""
        myJWToken = UserDefaults.standard.value(forKey: "myJWT") as? String ?? ""
//        HTTP Method : Post
        AF.request("https://knockit.life/app/users/\(UserIdx)/addresses",
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder(),
                   headers: [
                    "X-ACCESS-TOKEN" : myJWToken])
            .validate()
            .responseDecodable(of: AddressRegisterResponse.self) { response in
                switch response.result {
                case .success(let response):

                    
                    print("DEBUG >> Success \(response)")
                case .failure(let error):
                    print("DEBUG >> Get Error: \(error.localizedDescription)")
                }
            }
        
    }
}
