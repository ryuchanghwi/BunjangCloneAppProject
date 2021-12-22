//
//  StoreIntroBottomsheetVC.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit
import PanModal

class StoreIntroBottomsheetVC : UIViewController, UITextViewDelegate, storeIntroChangeDelegate {
    func storeIntroChange() {
        storeSettingVC?.storeIntroLabel.text = storeIntroTextView.text
    }
    
    var storeSettingVC : StoreSettingViewController?
    
    
    //MARK: - Properties
    @IBOutlet weak var storeIntroTextView: UITextView!
    
    func placeholerSetting() {
        storeIntroTextView.delegate = self
        storeIntroTextView.text = "자신 혹은 판매하는 상품에 대해 설명해주세요"
        storeIntroTextView.textColor = UIColor.lightGray
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if storeIntroTextView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "자신 혹은 판매하는 상품에 대해 설명해주세요"
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholerSetting()
        storeSettingVC?.storeIntroDelegate = self
    }
    
    
    
    //MARK: - Actions
    @IBAction func okayBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        storeIntroChange()
    }
    
}


extension StoreIntroBottomsheetVC : PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    var shortFormHeight: PanModalHeight {
        return .contentHeight(700)
    }
}
