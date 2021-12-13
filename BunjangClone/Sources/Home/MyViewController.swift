//
//  MyViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/05.
//

import Foundation
import UIKit
import SafariServices

class MyViewController: BaseViewController {
    //MARK: - Properties
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileStarImg: UIImageView!
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Actions
    @IBAction func myProfileBtn(_ sender: Any) {
        let storeSettingBSVC = UIStoryboard(name: "StoreSettingBottomsheet", bundle: nil).instantiateViewController(withIdentifier: "StoreSettingBottonsheetVC") as! StoreSettingBottonsheetVC
        presentPanModal(storeSettingBSVC)
    }
    @IBAction func myCertifiedBtn(_ sender: Any) {
    }
    @IBAction func storeQuestion(_ sender: Any) {
    }
    @IBAction func ADSafariBtn(_ sender: Any) {
        let blogUrl = NSURL(string: "https://www.britymail.com/static/employee/freemium/html/brityworksServiceInfo.html?locale=ko&utm_source=kakaomoment&utm_medium=display&utm_campaign=brityworks&utm_content=b")
        let blogView: SFSafariViewController = SFSafariViewController(url: blogUrl! as URL)
        self.present(blogView, animated: true, completion: nil)
    }
    @IBAction func mySettingBtn(_ sender: Any) {
        let mySettingStoryboard = UIStoryboard.init(name: "MySetting", bundle: nil)
        let MySettingVC = mySettingStoryboard.instantiateViewController(identifier: "MySettingViewController")
        self.navigationController?.pushViewController(MySettingVC, animated: true)
    }
    
    
}
