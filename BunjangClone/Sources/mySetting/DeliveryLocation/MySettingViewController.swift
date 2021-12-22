//
//  MySettingViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit

class MySettingViewController: BaseViewController {
    
    //MARK: - Propreties
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    //MARK: - Actions
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addressSettingBtn(_ sender: Any) {
        //push
//        let selfPayVC = UIStoryboard(name: "payment", bundle: nil).instantiateViewController(identifier: "SelfPaymentViewController") as! SelfPaymentViewController
//        self.navigationController?.pushViewController(selfPayVC, animated: true)

        let deliveryLocationVC = UIStoryboard(name: "DeliveryLocation", bundle: nil).instantiateViewController(identifier: "DeliveryLocationViewController") as! DeliveryLocationViewController
        self.navigationController?.pushViewController(deliveryLocationVC, animated: true)
        
        
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismissIndicator()
        
        self.presentAlert(title: "로그아웃 시 6개월이 지난 번개톡 대화목록이 삭제됩니다. 로그아웃 하시겠습니까?", message: "", isCancelActionIncluded: true) { action in
            UserDefaults.standard.set(false, forKey: "login_save")
            
            
            }
            
            

    }
    

}

}
