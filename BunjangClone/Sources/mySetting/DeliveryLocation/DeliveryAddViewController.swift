//
//  DeliveryAddViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit
protocol requestDelegate {
    func chageRequestLabel()
}


class DeliveryAddViewController: BaseViewController {
    var mySettingIdx: Int = 0
    var mySettingStatus: String = "Y"
    
    
    //MARK: Properties
    @IBOutlet weak var receivedNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var roadNameTextField: UITextField!
    @IBOutlet weak var requestTermLabel: UILabel!
    @IBOutlet weak var requestTermButton: UIButton!
    @IBOutlet weak var basicDeliveryButton: UIButton!
    
    
    var changeRequestLabelDelegate : requestDelegate?
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mySettingIdx = UserDefaults.standard.value(forKey: "myIdx") as? Int ?? 0
        mySettingStatus = "Y"
    }
    
    
    //MARK: - Actions
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func requestTermBtn(_ sender: Any) {
        //바텀

        let RequestBottomsheetVC = UIStoryboard(name: "RequestBottomsheet", bundle: nil).instantiateViewController(identifier: "RequestBottomsheetViewController") as! RequestBottomsheetViewController
        presentPanModal(RequestBottomsheetVC)
        RequestBottomsheetVC.deliveryAddVC = self
        
    }
    @IBAction func basicDeliveryBtn(_ sender: UIButton) {
        print(mySettingStatus)
        if sender.isSelected {
            sender.isSelected = false
            basicDeliveryButton.tintColor = UIColor.lightGray
            mySettingStatus = "Y"
        } else {
            sender.isSelected = true
            basicDeliveryButton.tintColor = #colorLiteral(red: 0.9683161378, green: 0.3097538948, blue: 0.3551049232, alpha: 1)
            mySettingStatus = "M"
            
        }
    }
    
    @IBAction func finishBtn(_ sender: Any) {
//        var addressSuccess : AddressRegisterResponse?
        AddressRegisterInfo.recipient = receivedNameTextField.text!
        AddressRegisterInfo.phone = phoneNumberTextField.text!
        AddressRegisterInfo.roadname = roadNameTextField.text!
        AddressRegisterInfo.requestMsg = requestTermLabel.text!
        AddressRegisterInfo.status = mySettingStatus
        AddressRegisterInfo.longitude = "126.97710"
        AddressRegisterInfo.latitude = "37.56528"
            
        AddressRegisterDataManager().userAddressRegisterPostData(UserIdx: mySettingIdx, viewController: self)


    }
    
    
}
