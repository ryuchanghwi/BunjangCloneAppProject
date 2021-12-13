//
//  RequestBottomsheetViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit
import PanModal

class RequestBottomsheetViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var doorBtn: UIButton!
    @IBOutlet weak var selfBtn: UIButton!
    @IBOutlet weak var securityBtn: UIButton!
    @IBOutlet weak var postBtn: UIButton!
    @IBOutlet weak var selfWriteBtn: UIButton!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    
    @IBAction func requestRadioBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            
        }
        else if sender.tag == 2 {
            
        }
        else if sender.tag == 3 {
            
        }
        else if sender.tag == 4 {
            
        }
        else if sender.tag == 5 {
            
        }
    }
    
    @IBAction func saveBtn(_ sender: Any) {
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
