//
//  GoodsCategoryViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/08.
//

import Foundation
import UIKit
 
class GoodCategoryViewController : BaseViewController, categoryDelegate {
    func changeCategoryLabel() {
        goodsRegisterVC?.categoryLabel.text = categoryListLabel
        goodsRegisterVC?.categoryLabel.textColor = UIColor.black
    }
    
    var goodsRegisterVC : GoodsRegisterViewController?
    var subGoodsCategoryVC : GoodsRegisterViewController?
    var categoryListLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goodsRegisterVC?.changeCategoryLabeldelegate = self
    }
    

    
    
    //MARK: - Actions
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func categoryListBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        switch sender.tag {
        case 1:
            categoryListLabel = "여성의류"
            print(categoryListLabel)
            changeCategoryLabel()
        case 2:
            categoryListLabel = "남성의류"
            print(categoryListLabel)
            changeCategoryLabel()
        case 3:
            categoryListLabel = "신발"
            changeCategoryLabel()
        case 4:
            categoryListLabel = "가방"
            changeCategoryLabel()
        case 5:
            categoryListLabel = "시계/쥬얼리"
            changeCategoryLabel()
        case 6:
            categoryListLabel = "패션 액세서리"
            changeCategoryLabel()
        case 7:
            categoryListLabel = "디지털/가전"
            changeCategoryLabel()
        case 8:
            categoryListLabel = "스포츠/레저"
            changeCategoryLabel()
        case 9:
            categoryListLabel = "차량/오토바이"
            changeCategoryLabel()
        case 10:
            categoryListLabel = "키덜트"
            changeCategoryLabel()
        case 11:
            categoryListLabel = "예술/희귀/수집품"
            changeCategoryLabel()
        case 12:
            categoryListLabel = "음반/악기"
            changeCategoryLabel()
        case 13:
            categoryListLabel = "도서/티켓/문구"
            changeCategoryLabel()
        case 14:
            categoryListLabel = "뷰티/미용"
            changeCategoryLabel()
        case 15:
            categoryListLabel = "가구/인테리어"
            changeCategoryLabel()
        case 16:
            categoryListLabel = "생활/가공식품"
            changeCategoryLabel()
        case 17:
            categoryListLabel = "유아동/출산"
            changeCategoryLabel()
        case 18:
            categoryListLabel = "반려동물용품"
            changeCategoryLabel()
        case 19:
            categoryListLabel = "기타"
            changeCategoryLabel()
        case 20:
            categoryListLabel = "지역 서비스"
            changeCategoryLabel()
        case 21:
            categoryListLabel = "원룸/함께살아요"
            changeCategoryLabel()
        case 22:
            categoryListLabel = "번개나눔"
            changeCategoryLabel()
        case 23:
            categoryListLabel = "재능"
            changeCategoryLabel()
        case 24:
            categoryListLabel = "구인구직"
            changeCategoryLabel()
        case 25:
            categoryListLabel = "커뮤니티"
            changeCategoryLabel()
            
        default:
            categoryListLabel = ""
            
        }
        
    }
    
    
}
