//
//  RequestBottomsheetViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit
import PanModal

class RequestBottomsheetViewController: UIViewController, requestDelegate {
    func chageRequestLabel() {
        deliveryAddVC?.requestTermLabel.text = requestLabel
        deliveryAddVC?.requestTermLabel.textColor = UIColor.black
    }
    
    
    
    var deliveryAddVC : DeliveryAddViewController?
    var requestLabel : String = ""
    
    
    
    
    
    //MARK: - Properties
    @IBOutlet weak var doorBtn: UIButton!
    @IBOutlet weak var selfBtn: UIButton!
    @IBOutlet weak var securityBtn: UIButton!
    @IBOutlet weak var postBtn: UIButton!
    @IBOutlet weak var selfWriteBtn: UIButton!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doorBtn.tintColor = #colorLiteral(red: 0.9683161378, green: 0.3097538948, blue: 0.3551049232, alpha: 1)
        deliveryAddVC?.changeRequestLabelDelegate = self

    }
    
    //MARK: - Actions
    
    @IBAction func requestRadioBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            doorBtn.tintColor = #colorLiteral(red: 0.9683161378, green: 0.3097538948, blue: 0.3551049232, alpha: 1)
            selfBtn.tintColor = UIColor.white
            securityBtn.tintColor = UIColor.white
            postBtn.tintColor = UIColor.white
            selfWriteBtn.tintColor = UIColor.white
            requestLabel = "문앞"
        }
        if sender.tag == 2 {
            selfBtn.tintColor = #colorLiteral(red: 0.9683161378, green: 0.3097538948, blue: 0.3551049232, alpha: 1)
            doorBtn.tintColor = UIColor.white
            securityBtn.tintColor = UIColor.white
            postBtn.tintColor = UIColor.white
            selfWriteBtn.tintColor = UIColor.white
            requestLabel = "직접 받고 부재 시 문앞"
            
        }
        if sender.tag == 3 {
            securityBtn.tintColor  = #colorLiteral(red: 0.9683161378, green: 0.3097538948, blue: 0.3551049232, alpha: 1)
            selfBtn.tintColor = UIColor.white
            doorBtn.tintColor = UIColor.white
            postBtn.tintColor = UIColor.white
            selfWriteBtn.tintColor = UIColor.white
            requestLabel = "경비실"
            
        }
        if sender.tag == 4 {
            postBtn.tintColor = #colorLiteral(red: 0.9683161378, green: 0.3097538948, blue: 0.3551049232, alpha: 1)
            doorBtn.tintColor = UIColor.white
            selfBtn.tintColor = UIColor.white
            securityBtn.tintColor = UIColor.white
            selfWriteBtn.tintColor = UIColor.white
            requestLabel = "우편함"
            
        }
        if sender.tag == 5 {
            selfWriteBtn.tintColor = #colorLiteral(red: 0.9683161378, green: 0.3097538948, blue: 0.3551049232, alpha: 1)
            doorBtn.tintColor = UIColor.white
            selfBtn.tintColor = UIColor.white
            postBtn.tintColor = UIColor.white
            securityBtn.tintColor = UIColor.white
            requestLabel = "적접입력"
        }
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        chageRequestLabel()
    }
    
    
    
    
}


extension RequestBottomsheetViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    var shortFormHeight: PanModalHeight {
        return .contentHeight(500)
    }
}
