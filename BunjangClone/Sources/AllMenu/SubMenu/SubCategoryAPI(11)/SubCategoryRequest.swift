//
//  SubCategoryRequest.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/17.
//

import Foundation
import UIKit
import Alamofire

class SubCategoryRequest {
    func getSubCategoryData(_ viewController: SubCategoryVC) {
        let url = "https://knockit.life/app/categories/1"
        var myJWToken : String = ""
        myJWToken = UserDefaults.standard.value(forKey: "myJWT") as? String ?? ""
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["X-ACCESS-TOKEN" : myJWToken])
            .validate()
            .responseDecodable(of: SubCategoryResponse.self) {
                response in
                switch response.result {
                case .success(let response):
                    print("DEBUG >> SubCategory Response \(response)")
                    viewController.didRetrieveSubCategory(response.result)
                case .failure(let error):
                    print("DEBUG >> SubCategory Error: \(error.localizedDescription)")
                }
            }
    }
}

