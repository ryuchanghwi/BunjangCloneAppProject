//
//  SelfLoginViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/05.
//



import Foundation
import UIKit
import TweeTextField
class SelfSignInViewController: BaseViewController, UITextViewDelegate {
    //MARK: - Properties
    
    @IBOutlet var nameTextField: TweeAttributedTextField!
    @IBOutlet var emailTextField: TweeAttributedTextField!
    @IBOutlet var passwordTextField: TweeAttributedTextField!
    @IBOutlet var storeNameTextField: TweeAttributedTextField!
    @IBOutlet weak var correctBtn: UIButton!
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        correctBtn.layer.cornerRadius = 5
        //Dismiss Keyboard When Tapped Arround

    }
    
    //MARK: - Actions
    @IBAction func backBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func EmailWhileEditing(_ sender: TweeAttributedTextField) {

        
        
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
    
    
    
    @IBAction func nextBtn(_ sender: Any) {
        if nameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "nil" || storeNameTextField.text == "" {
            let failAlert = UIAlertController(title: "회원가입 실패", message: "모든 사항을 입력해주세요", preferredStyle: .alert)
            let okayBtn = UIAlertAction(title: "확인", style: .default, handler: nil)
            failAlert.addAction(okayBtn)
            present(failAlert, animated: true, completion: nil)
        } else {
            SelfSignInUserInto.email = emailTextField.text!
            SelfSignInUserInto.password = passwordTextField.text!
            SelfSignInUserInto.storeName = storeNameTextField.text!
            SelfSignInDataManager().signInPostData()
            

            
            showIndicator() //로딩나타남
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.dismissIndicator() //로딩해제
                
            }
            dismiss(animated: true, completion: nil)
            
        }
    }
    
}
