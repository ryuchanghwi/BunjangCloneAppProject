//
//  DeliveryRegisterVC.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/16.
//

import Foundation
import UIKit

class DeliveryRegisterVC : BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func registerBtn(_ sender: Any) {
        guard let deliveryAddVC = self.storyboard?.instantiateViewController(identifier: "DeliveryAddViewController") else { return }
        self.navigationController?.pushViewController(deliveryAddVC, animated: true)
    }
}
