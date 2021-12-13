//
//  StoreSettingViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit

protocol storeIntroChangeDelegate {
    func storeIntroChange()
}
protocol exchangePolicyChangeDelegate {
    func exchangePolicyChange()
}
protocol precautionsChangeDelegate {
    func precautionChange()
}



class StoreSettingViewController: BaseViewController, UITextFieldDelegate {
    var storeIntroDelegate : storeIntroChangeDelegate?
    var exchangePoliyDelegate : exchangePolicyChangeDelegate?
    var precautionsDelegate : precautionsChangeDelegate?
    
    
    //MARK: - Properties
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var profileImgButtom: UIButton!
    @IBOutlet weak var storeNameTextField: UITextField!
    @IBOutlet weak var storeAddressTextField: UITextField!
    @IBOutlet weak var variableTImeTextField: UITextField!
    
    var mySettingIdx : Int = 0
    let picker = UIImagePickerController()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        storeNameTextField.delegate = self
        storeAddressTextField.delegate = self
        variableTImeTextField.delegate = self
        mySettingIdx = UserDefaults.standard.value(forKey: "myIdx") as? Int ?? 0
        //API
        StoreSettingRequest().getStoreSettingData(IdxVaule: mySettingIdx, self)
        
    }
    
    
    
    //MARK: - Actions
    
    @IBAction func profileImgBtn(_ sender: Any) {
        openLibrary()
    }
    
    
    @IBAction func profileFixBtn(_ sender: Any) {
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func StoreIntroBtn(_ sender: Any) {
        let storeIntroVC = UIStoryboard(name: "StoreSettingBS", bundle: nil).instantiateViewController(withIdentifier: "StoreIntroBottomsheetVC") as! StoreIntroBottomsheetVC
        presentPanModal(storeIntroVC)
    }
    @IBAction func exchangePolicyBtn(_ sender: Any) {
        let exchangePolicyVC = UIStoryboard(name: "StoreSettingBS", bundle: nil).instantiateViewController(withIdentifier: "ExchangePolicyVC") as! ExchangePolicyVC
        presentPanModal(exchangePolicyVC)
    }
    @IBAction func beforeBuyBtn(_ sender: Any) {
        let precautionsVC = UIStoryboard(name: "StoreSettingBS", bundle: nil).instantiateViewController(withIdentifier: "PrecationsBottomsheetVC") as! PrecationsBottomsheetVC
        presentPanModal(precautionsVC)
    }
    
    
    
}


extension StoreSettingViewController {
    func didSuccess(_ response: StoreSettingResponse) {
        let myStoreName = response.result?.storeName
        self.storeNameTextField.text = myStoreName
        
        let myStoreAddress = response.result?.storeAddress
        self.storeAddressTextField.text = myStoreAddress
        
        profileImgView.layer.cornerRadius = profileImgView.frame.width / 2
        profileImgView.clipsToBounds = true
        
        
    }
}

extension StoreSettingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        func openLibrary() {
            picker.sourceType = .photoLibrary
            present(picker, animated:  false, completion: nil)
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as?
                UIImage {
                profileImgView.contentMode = .scaleAspectFill
                profileImgView.image = pickedImage
            }
            dismiss(animated: true, completion: nil)
        }
    }
