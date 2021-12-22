//
//  LocationRequest.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/09.
//

import Foundation
import UIKit
import Alamofire

class LocationRequest {
    func getLocationData(queryValue: String, _ viewContrller: LocationViewController) {
        let url = "https://openapi.naver.com/v1/search/local.json"
        let params: Parameters = [
            "query": "\(queryValue)",
            "display": 100 ]
        let LocationHeaders: HTTPHeaders = [
            "X-Naver-Client-Id" : "0yJz0j5mZL_FfJvDfIKO",
            "X-Naver-Client-Secret" : "kElzMnPNaB"
        ]
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: LocationHeaders)
            .validate()
            .responseDecodable(of: LocationResponse.self) { response in
                
                switch response.result {
                case .success(let response):
                    print("DEBUG>> Location Response \(response)")

                    LocationResult.LocationSearchState = true
                    viewContrller.didRetrieveLocation(result: response)
                
                    
                case .failure(let error):
                    print("DEBUG >> Location Get Error : \(error.localizedDescription)")
                }
            }
    }


 
}

