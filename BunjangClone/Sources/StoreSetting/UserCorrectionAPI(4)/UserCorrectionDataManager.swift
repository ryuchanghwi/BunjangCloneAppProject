//
//  UserCorrectionDataManager.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/14.
//

import Foundation
import UIKit
import Alamofire
class UserCorrectionDataManager {
    func userCorrectionPatchData(IdxValue: Int, _ viewController: StoreSettingViewController) {
        
        var myJWToken : String = ""
        myJWToken = UserDefaults.standard.value(forKey: "myJWT") as? String ?? ""
        let params = ["profiles" : UserCorrectionInfo.profiles,
                      "storeName" : UserCorrectionInfo.storename,
                      "storeAddress" : UserCorrectionInfo.storeAddress,
                      "contactableTime" : UserCorrectionInfo.contactableTime,
                      "storeIntro" :  UserCorrectionInfo.storename,
                      "tradePolicy" : UserCorrectionInfo.tradePolicy,
                      "flag" : UserCorrectionInfo.flag
        ]
        
        
        //HTTP Method: Patch
        AF.request("https://knockit.life/app/users/\(IdxValue)",
                   method: .patch,
                   parameters: params,
                   encoder: JSONParameterEncoder(),
                   headers: ["X-ACCESS-TOKEN": myJWToken])
            .validate()
            .responseDecodable(of: UserCorrectionResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("DEBUG >> Success \(response)")
                case .failure(let error):
                    print("DEBUG >> Get Error: \(error.localizedDescription)")
                }
            }
        
        
    }
}
