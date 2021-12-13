//
//  MySettingViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit

class MySettingViewController: BaseViewController {
    //MARK: - Propreties
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    //MARK: - Actions
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addressSettingBtn(_ sender: Any) {
        
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        
    }
    

}
