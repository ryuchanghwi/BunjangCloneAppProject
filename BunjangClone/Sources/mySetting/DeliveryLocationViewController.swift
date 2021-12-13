//
//  DeliveryLocationViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit

class DeliveryLocationViewController: BaseViewController {
    let myClickVC = ClickVC()
    let myDelivertVC = DeliveryVC()
    private func setup() {
        addChild(myClickVC)
        addChild(myDelivertVC)
        
        self.view.addSubview(myClickVC.view)
        self.view.addSubview(myDelivertVC.view)
        
        myClickVC.didMove(toParent: self)
        myDelivertVC.didMove(toParent: self)
        
        myClickVC.view.frame = self.view.bounds
        myDelivertVC.view.frame = self.view.bounds
        myDelivertVC.view.isHidden = true
    }
    
    
    
    //MARK - Properties
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - Actions
    @IBAction func registerBtn(_ sender: Any) {
        guard let deliveryAddVC = self.storyboard?.instantiateViewController(identifier: "DeliveryAddViewController") else { return }
        self.navigationController?.pushViewController(deliveryAddVC, animated: true)
        
    }
}
//let storeSettingStoryboard = UIStoryboard.init(name: "StoreSetting", bundle: nil)
//guard let storeSettingVC = storeSettingStoryboard.instantiateViewController(identifier: "StoreSettingViewController") as? StoreSettingViewController else { return }
//storeSettingVC.modalPresentationStyle = .fullScreen
//present(storeSettingVC, animated: true, completion: nil)
