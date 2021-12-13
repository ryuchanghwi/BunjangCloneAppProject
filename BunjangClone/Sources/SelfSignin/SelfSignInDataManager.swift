//
//  SelfSignInManager.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/09.
//

import Foundation
import Alamofire

class SelfSignInDataManager {
    func signInPostData() {
        let url = "\(Constant.BASE_URL)/users" 
        let params = ["email" : SelfSignInUserInto.email,
                      "password" : SelfSignInUserInto.password,
                      "storeName" : SelfSignInUserInto.storeName,
                      "userType": SelfSignInUserInto.userType
        ]
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder(),
                   headers: nil)
            .validate()
            .responseDecodable(of: SelfSignInResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("DEBUG >> Success \(response)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

