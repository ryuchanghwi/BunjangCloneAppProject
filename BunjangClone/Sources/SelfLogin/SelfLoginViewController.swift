//
//  SelfLoginViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/10.

//*********로그인 할때만 페이지 넘어가게 수정하기*********




//

import Foundation
import UIKit
import TweeTextField

class SelfLoginViewController: BaseViewController, UITextFieldDelegate {
    //MARK: - Properties
    @IBOutlet weak var selfLoginIDTextField: TweeAttributedTextField!
    @IBOutlet weak var selfLoginOKBtn: UIButton!
    @IBOutlet weak var selfLoginPasswordTextField: TweeAttributedTextField!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        selfLoginOKBtn.layer.cornerRadius = 5
        selfLoginPasswordTextField.delegate = self
        selfLoginPasswordTextField.delegate = self
        
    }
    
    //MARK: - Actions
    @IBAction func selfLogInBtn(_ sender: Any) {
        //API
        DispatchQueue.main.async {
            SelfLoginUserInfo.loginEmail = self.selfLoginIDTextField.text!
            SelfLoginUserInfo.loginPassword = self.selfLoginPasswordTextField.text!
            SelfLoginDataManager().LoginPostData()
        }

        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            if LoginResponse.ResponseState == true {
                
                UserDefaults.standard.set(true, forKey: "login_save")
                
                let mainstoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                guard let homeNavigationVC = mainstoryboard.instantiateViewController(identifier: "HomeNavigationViewController") as? HomeNavigationViewController else { return }
                homeNavigationVC.modalPresentationStyle = .fullScreen
                self.present(homeNavigationVC, animated: true, completion: nil)
            
             }
        }
        //데이터 저장


    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func IDWhileEditing(_ sender: TweeAttributedTextField) {
        if let userInput = sender.text {
            if userInput.count == 0 {
                    return
        }
        
        if userInput.isValidEmail == true {
            sender.infoTextColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            sender.showInfo("이메일 형식입니다.", animated: true)
        } else {
            sender.infoTextColor = .red
            sender.showInfo("이메일 형식이 아닙니다.", animated: true)
                }
            }
    }
    
    
    
}
