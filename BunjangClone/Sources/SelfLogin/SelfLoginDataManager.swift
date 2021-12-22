//
//  SelfLoginDataManager.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/10.
//

import Foundation
import Alamofire

class SelfLoginDataManager {
    func LoginPostData() {
        let url = "https://knockit.life/app/users/logIn"
        let LoginParams = ["email" : SelfLoginUserInfo.loginEmail,
                           "password" : SelfLoginUserInfo.loginPassword
        ]
        AF.request(url,
                   method: .post,
                   parameters: LoginParams,
                   encoder: JSONParameterEncoder(),
                   headers: nil)
            .validate()
            .responseDecodable(of: SelfLoginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("DEBUG >> Success \(response)")
                    LoginResponse.ResponseState = response.isSuccess!
                    LoginResponse.myUserIdx = response.result?.userIdx ?? 0
                    LoginResponse.myJWT = response.result?.jwt ?? ""
                    UserDefaults.standard.set(LoginResponse.myUserIdx, forKey: "myIdx")
                    UserDefaults.standard.set(LoginResponse.myJWT, forKey: "myJWT")
                    print(LoginResponse.myUserIdx, "나의 UserIdx값")
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }

    }
}
