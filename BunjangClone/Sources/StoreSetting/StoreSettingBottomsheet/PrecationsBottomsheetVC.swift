//
//  PrecationsBottomsheetVC.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit
import PanModal

class PrecationsBottomsheetVC : UIViewController, UITextViewDelegate, precautionsChangeDelegate {
    func precautionChange() {
        storeSettingVC?.beforeBuyLabel.text = PrecautionTextView.text
    }

    var storeSettingVC : StoreSettingViewController?
    
    
    
    
    //MARK: - Properties
    @IBOutlet weak var PrecautionTextView: UITextView!
    
    
    func placeholerSetting() {
        PrecautionTextView.delegate = self
        PrecautionTextView.text = "상품의 사이즈, 색상을 확인하시고 구매세요^^"
        PrecautionTextView.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if PrecautionTextView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "상품의 사이즈, 색상을 확인하시고 구매하세요^^"
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholerSetting()
        storeSettingVC?.precautionsDelegate = self
    }
    
    
    //MARK: - Actions
    @IBAction func okayBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        precautionChange()
    }
    
    
}


extension PrecationsBottomsheetVC: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(700)
    }
}
