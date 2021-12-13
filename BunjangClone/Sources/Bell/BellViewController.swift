//
//  BellViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/13.
//

import Foundation
import UIKit

class BellViewController : BaseViewController {
    //MARK: - Properties
    @IBOutlet weak var newInfoLabel: UIButton!
    @IBOutlet weak var keywordAlarmLabel: UIButton!
    @IBOutlet weak var newInfoBottomView: UIView!
    @IBOutlet weak var keywordAlarmBottomView: UIView!
    @IBOutlet weak var writeButton: UIButton!
    
    
    let NewVC = NewInfoVC()
    let KeyVC = KeywordAlarmVC()
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        newInfoLabel.tintColor = UIColor.black
        newInfoBottomView.tintColor = UIColor.black
    }
    
    
    
    private func setup() {
        addChild(NewVC)
        addChild(KeyVC)
        self.view.addSubview(NewVC.view)
        self.view.addSubview(KeyVC.view)
        
        NewVC.view.frame = self.view.bounds
        KeyVC.view.frame = self.view.bounds
        KeyVC.view.isHidden = true
        
    }
    
    
    
    //MARK: - Actions
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func settingBtn(_ sender: Any) {
    }
    @IBAction func writeBtn(_ sender: Any) {
    }
    
    @IBAction func infoKeywordRadioBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            newInfoLabel.tintColor = UIColor.black
            newInfoBottomView.tintColor = UIColor.black
            keywordAlarmLabel.tintColor = UIColor.lightGray
            keywordAlarmBottomView.tintColor = UIColor.lightGray
            NewVC.view.isHidden = false
            KeyVC.view.isHidden = true
        }
        else if sender.tag == 2 {
            newInfoLabel.tintColor = UIColor.lightGray
            newInfoBottomView.tintColor = UIColor.lightGray
            keywordAlarmLabel.tintColor = UIColor.black
            keywordAlarmBottomView.tintColor = UIColor.black
            KeyVC.view.isHidden = false
            NewVC.view.isHidden = true
        }
    }
    
    
}
