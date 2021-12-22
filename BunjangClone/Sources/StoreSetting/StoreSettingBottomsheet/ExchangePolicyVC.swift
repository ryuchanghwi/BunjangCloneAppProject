//
//  ExchangePolicyVC.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit
import PanModal
class ExchangePolicyVC : UIViewController, UITextViewDelegate, exchangePolicyChangeDelegate  {
    func exchangePolicyChange() {
        storeSettingVC?.exchangePolicyLabel.text = ExchangePoliyTextView.text
    }
    
    
    var storeSettingVC : StoreSettingViewController?
    
    
    //MARK: - Properties
    @IBOutlet weak var ExchangePoliyTextView: UITextView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholerSetting()
        storeSettingVC?.exchangePoliyDelegate = self
    }
    
    //MARK: - Actions
    @IBAction func okayBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        exchangePolicyChange()
    }
    
    
    
    
    func placeholerSetting() {
        ExchangePoliyTextView.delegate = self
        ExchangePoliyTextView.text =
        """
        입력하신 내용으로 교환/반품/환불 정책이 변경됩니다. 입력한
        내용이 없으면 번개장터 기본정택으로 표시됩니다.
        
        (기본정책)물품의 상태가 기재된 것과 상이할 경우 배송완료일
        기준 7일 이내에 환불 및 반품이 가능합니다.
        """
        ExchangePoliyTextView.textColor = UIColor.lightGray
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if ExchangePoliyTextView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = """
                        입력하신 내용으로 교환/반품/환불 정책이 변경됩니다. 입력한
                        내용이 없으면 번개장터 기본정택으로 표시됩니다.
                        
                        (기본정책)물품의 상태가 기재된 것과 상이할 경우 배송완료일
                        기준 7일 이내에 환불 및 반품이 가능합니다.
                """
            textView.textColor = UIColor.lightGray
            
        }
    }
}


extension ExchangePolicyVC : PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(700)
    }
}
