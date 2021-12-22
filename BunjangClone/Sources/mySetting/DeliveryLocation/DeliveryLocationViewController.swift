//
//  DeliveryLocationViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit

class DeliveryLocationViewController: BaseViewController {
    @IBOutlet weak var deliveryRegisterVCView: UIView!
    @IBOutlet weak var deliveryTableVC: UIView!
    
    
    //MARK - Properties
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    

    
    
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
//let storeSettingStoryboard = UIStoryboard.init(name: "StoreSetting", bundle: nil)
//guard let storeSettingVC = storeSettingStoryboard.instantiateViewController(identifier: "StoreSettingViewController") as? StoreSettingViewController else { return }
//storeSettingVC.modalPresentationStyle = .fullScreen
//present(storeSettingVC, animated: true, completion: nil)
