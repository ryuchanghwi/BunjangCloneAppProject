//
//  DeliveryAddViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit

class DeliveryAddViewController: BaseViewController {
    //MARK: Properties
    @IBOutlet weak var receivedNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var roadNameTextField: UITextField!
    @IBOutlet weak var requestTermLabel: UILabel!
    @IBOutlet weak var requestTermButton: UIButton!
    @IBOutlet weak var basicDeliveryButton: UIButton!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Actions
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func requestTermBtn(_ sender: Any) {
        
    }
    @IBAction func basicDeliveryBtn(_ sender: Any) {
    }
    
}
