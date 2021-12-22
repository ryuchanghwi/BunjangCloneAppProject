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
//                let subCategoryVC = UIStoryboard(name: "SubCategory", bundle: nil).instantiateViewController(identifier: "SubCategoryVC") as! SubCategoryVC
//                self.navigationController?.pushViewController(subCategoryVC, animated: true)
        
        
        
        let subCategoryStoryboard = UIStoryboard.init(name: "SubCategory", bundle: nil)
        guard let subCateboryVC = subCategoryStoryboard.instantiateViewController(identifier: "SubCategoryVC") as? SubCategoryVC else { return }
        subCateboryVC.modalPresentationStyle = .fullScreen
        present(subCateboryVC, animated: true, completion: nil)
    }
    
    
}
