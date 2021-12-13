//
//  CategoryViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/06.
//

import Foundation
import UIKit
import SafariServices

class CategoryViewController: BaseViewController {
    //MARK: - Properties
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    //MARK: - Actions
    @IBAction func safariLinkBtn(_ sender: Any) {
        let blogUrl = NSURL(string: "https://m.oliveyoung.co.kr/m/display/getBrandShopDetail.do?onlBrndCd=A000866&utm_source=kakao&utm_medium=social&utm_campaign=mdb3_W.DRESSROOM&chlNo=27&chlDtlNo=1012#load_BrndLst")
        let blogView: SFSafariViewController = SFSafariViewController(url: blogUrl! as URL)
        self.present(blogView, animated: true, completion: nil)
    }
    
    @IBAction func sneakersBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "bottomsheet", bundle: nil).instantiateViewController(withIdentifier: "BottomSheetVC") as! BottomSheetVC
        presentPanModal(vc)
    }
    
    
}
