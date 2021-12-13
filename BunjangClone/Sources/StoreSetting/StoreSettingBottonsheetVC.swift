//
//  StoreSettingBottomsheet.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import PanModal
import UIKit

class StoreSettingBottonsheetVC : UIViewController {
    //MARK: - Propreties
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Actions
    
    @IBAction func fixBtn(_ sender: Any) {
        let storeSettingStoryboard = UIStoryboard.init(name: "StoreSetting", bundle: nil)
        guard let storeSettingVC = storeSettingStoryboard.instantiateViewController(identifier: "StoreSettingViewController") as? StoreSettingViewController else { return }
        storeSettingVC.modalPresentationStyle = .fullScreen
        present(storeSettingVC, animated: true, completion: nil)
    }
    
    
}
//let selfSignInStoryboard = UIStoryboard.init(name: "SelfSignIn", bundle: nil)
//guard let selfSignInVC = selfSignInStoryboard.instantiateViewController(identifier: "SelfSignInViewController") as? SelfSignInViewController else { return }
//selfSignInVC.modalPresentationStyle = .fullScreen
//present(selfSignInVC, animated: true, completion: nil)

extension StoreSettingBottonsheetVC: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(260)
    }

}
