//
//  GoodsExplan.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/07.
//

import Foundation
import UIKit

class GoodsExplanViewController: BaseViewController, UITextViewDelegate, goodsExplaneDelegate {
    func saveGoodsExplaneTextView() {
        goodsRegisterVC?.goodsExplanLabel.text = explaneTextView.text
        goodsRegisterVC?.goodsExplanLabel.textColor = UIColor.black
    }
    
    //Delegate
    var goodsRegisterVC : GoodsRegisterViewController?

    
    
    //MARK: - Properties
    @IBOutlet weak var explaneTextView: UITextView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholerSetting()
        goodsRegisterVC?.chageGoodsExplanLabeldelegate = self
    }
    
    
    func placeholerSetting() {
        explaneTextView.delegate = self
        explaneTextView.text =
            """
        상품정보를 입력해주세요
        구입일자, 브랜드, 사용감 등 상품정보를 자세히 입력하면 거래를 더욱 원활하게 진행할 수 있습니다.
        """
        explaneTextView.textColor = UIColor.lightGray
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if explaneTextView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text =
                """
            상품정보를 입력해주세요
            구입일자, 브랜드, 사용감 등 상품정보를 자세히 입력하면 거래를 더욱 원활하게 진행할 수 있습니다.
            """
            textView.textColor = UIColor.lightGray
        }
    }
    
    //MARK: - Actions
    @IBAction func xBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveTextViewBtn(_ sender: Any) {

        saveGoodsExplaneTextView()
        dismiss(animated: true, completion: nil)
    }
    
    
}


//goodsExplaneDelegate
//goodsExplanButton
