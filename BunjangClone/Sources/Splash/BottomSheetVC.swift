//
//  OtherWayLoginViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/04.
//

import Foundation
import PanModal
import UIKit

class BottomSheetVC: UIViewController {
    //MARK: - Properties
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Actions
    @IBAction func selfLoginBtn(_ sender: Any) {
        let selfSignInStoryboard = UIStoryboard.init(name: "SelfSignIn", bundle: nil)
        guard let selfSignInVC = selfSignInStoryboard.instantiateViewController(identifier: "SelfSignInViewController") as? SelfSignInViewController else { return }
        selfSignInVC.modalPresentationStyle = .fullScreen
        present(selfSignInVC, animated: true, completion: nil)
        }
    
}

extension BottomSheetVC: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }
}
