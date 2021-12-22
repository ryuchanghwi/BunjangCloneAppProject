//
//  GoodsRegisterDataManager.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/17.
//

import Foundation
import UIKit
import Alamofire

class GoodsRegisterDataManager {
    func goodsRegisterPostData(IdxValue: Int, _ viewController: GoodsRegisterViewController, Parameters: GoodsRegisterUserInfo) {
        
        var myJWToken : String = ""
        myJWToken = UserDefaults.standard.value(forKey: "myJWT") as? String ?? ""
        
        
        
        
        
        //HTTP Method: Post
        AF.request("https://knockit.life/app/products/\(IdxValue)",
                   method: .post,
                   parameters: Parameters,
                   encoder: JSONParameterEncoder(),
                   headers: ["X-ACCESS-TOKEN": myJWToken])
            .validate()
            .responseDecodable(of: GoodsRegisterResponse.self) {
                response in
                switch response.result {
                case .success(let response):
                    print("DEBUG >> Success \(response)")
                case .failure(let error):
                    print("DEBUG >> Get Error: \(error.localizedDescription)")
                    
                }
                
            }
    }
}
