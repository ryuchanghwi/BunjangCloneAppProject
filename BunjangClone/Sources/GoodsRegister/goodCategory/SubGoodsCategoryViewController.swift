//
//  SubGoodsCategoryViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/08.
//

import Foundation
import UIKit

class SubGoodsCategoryViewController: BaseViewController, categoryDelegate {
    func changeCategoryLabel() {
        goodsRegisterVC?.categoryLabel.text = subCategoryLabel
    }
    
    var goodsRegisterVC : GoodsRegisterViewController?
    
    //MARK: - Properties
    @IBOutlet weak var sneakersLabel: UILabel!
    @IBOutlet weak var menShoesLabel: UILabel!
    @IBOutlet weak var womenShoesLabel: UILabel!
    
    var subCategoryLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goodsRegisterVC?.changeCategoryLabeldelegate = self
    }
    
    @IBAction func backCategoryBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func shoesCategoryBtn(_ sender: UIButton) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        for aViewController in viewControllers {
            if aViewController is GoodsRegisterViewController {
                self.navigationController!.popToViewController(aViewController, animated: true)
            }
        }
        if sender.tag == 1 {
            subCategoryLabel = "스니커즈"
        }
        else if sender.tag == 2 {
            subCategoryLabel = "남성화"
        }
        else if sender.tag == 3 {
            subCategoryLabel = "여성화"
        }
        changeCategoryLabel()
        
    }
    
}
