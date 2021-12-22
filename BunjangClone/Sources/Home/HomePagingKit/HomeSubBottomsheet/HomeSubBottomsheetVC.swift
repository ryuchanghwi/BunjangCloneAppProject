//
//  HomeSubBottomsheetVC.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/15.
//

import Foundation
import UIKit
import PanModal


class HomeSubBottomsheetVC : BaseViewController {
    //MARK: - Properties
    
    
    //MARK - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func parcelBtn(_ sender: Any) {
    }
    
    @IBAction func selfBtn(_ sender: Any) {

        let paymentStoryboard = UIStoryboard.init(name: "payment", bundle: nil)
        guard let selfPaymentVC = paymentStoryboard.instantiateViewController(identifier: "SelfPaymentViewController") as? SelfPaymentViewController else { return }
        selfPaymentVC.modalPresentationStyle = .fullScreen
        present(selfPaymentVC, animated: true, completion: nil)
        
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
}


extension HomeSubBottomsheetVC: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(400)
    }
}
