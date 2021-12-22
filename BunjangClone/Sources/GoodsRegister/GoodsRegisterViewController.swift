//
//  GoodsRegisterViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/06.
//

import Foundation
import UIKit

protocol goodsExplaneDelegate {
    func saveGoodsExplaneTextView()
}
protocol categoryDelegate {
    func changeCategoryLabel()
}
protocol locationDelegate {
    func changeLocationLabel()
}
protocol tagDelegate {
    func changeTagLabel()
}
protocol threeOptionDelegate {
    func changeOptionLabel()
}


class GoodsRegisterViewController: BaseViewController, UIScrollViewDelegate {
    var chageGoodsExplanLabeldelegate: goodsExplaneDelegate?
    
    var changeCategoryLabeldelegate: categoryDelegate?
    
    var changeLocationLabeldelegate: locationDelegate?
    
    var changeTagLabeldelegate: tagDelegate?
    
    var changeThreeOptionLabeldelegate: threeOptionDelegate?
    
    //API 값 설정
    var goodsConditions : String = "U"
    var goodsExchange : String = "N"
    
    
    let picker = UIImagePickerController()

    //MARK: - Properties
    @IBOutlet var feeContainBtn: UIButton!
    @IBOutlet var discussionPosibleBtn: UIButton!
    @IBOutlet weak var priceInputTextfield: UITextField!
    @IBOutlet weak var safePaywelcomeView: UIButton!
    @IBOutlet weak var registerScrollView: UIScrollView!
    @IBOutlet weak var goodsExplanButton: UIButton!
    @IBOutlet weak var goodsExplanLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var relatedTagLabel: UILabel!
    //수량
    @IBOutlet weak var goodsCountLabel: UILabel!
    //중고, 새상품
    @IBOutlet weak var newOrOldGooldsLabel: UILabel!
    //교환 가능 여부
    @IBOutlet weak var exchangeLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feeContainBtn.alignTextBelow(spacing: 4)
        discussionPosibleBtn.alignTextBelow(spacing: 4)
        feeContainBtn.tintColor = UIColor.lightGray
        discussionPosibleBtn.tintColor = UIColor.lightGray
        registerScrollView.delegate = self
        //갤러리 접근
        picker.delegate = self
        galleryButton.layer.borderWidth = 1
        galleryButton.layer.borderColor = UIColor.lightGray.cgColor
        
        //API 체크
    }
    
    
    //MARK: - Actions
    @IBAction func checkRadioBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            feeContainBtn.isSelected = true
            discussionPosibleBtn.isSelected = false
            feeContainBtn.tintColor = #colorLiteral(red: 1, green: 0.4097604156, blue: 0.4096620679, alpha: 1)
            discussionPosibleBtn.tintColor = UIColor.lightGray
            priceInputTextfield.placeholder = "가격 입력"
        }
        else if sender.tag == 2 {
            feeContainBtn.isSelected = false
            discussionPosibleBtn.isSelected = true
            priceInputTextfield.placeholder = "연락 요망"
            feeContainBtn.tintColor = UIColor.lightGray
            discussionPosibleBtn.tintColor = #colorLiteral(red: 1, green: 0.4078431373, blue: 0.4078431373, alpha: 1)
        }
    }
    
    @IBAction func safePayBtn(_ sender: UIButton) {

    }
    
    
    @IBAction func locationBtn(_ sender: Any) {
        let locationStoryboard = UIStoryboard.init(name: "Location", bundle: nil)
        let locationVC = locationStoryboard.instantiateViewController(identifier: "LocationViewController")
        self.navigationController?.pushViewController(locationVC, animated: true)
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func goodsExplanBtn(_ sender: Any) {
        let goodsExplanStoryboard = UIStoryboard.init(name: "GoodsExplan", bundle: nil)
        guard let goodsExplanVC = goodsExplanStoryboard.instantiateViewController(identifier: "GoodsExplanViewController") as? GoodsExplanViewController else { return }
        goodsExplanVC.modalPresentationStyle = .automatic
        present(goodsExplanVC, animated: true, completion: nil)
        goodsExplanVC.goodsRegisterVC = self
        //delegation
    }
    @IBAction func categoryBtn(_ sender: Any) {
        let goodsCategoryStoryboard = UIStoryboard.init(name: "GoodCategory", bundle: nil)
        guard let goodsCategoryVC = goodsCategoryStoryboard.instantiateViewController(identifier: "GoodCategoryViewController") as? GoodCategoryViewController else { return }
        self.navigationController?.pushViewController(goodsCategoryVC, animated: true)
        
        
        goodsCategoryVC.goodsRegisterVC = self
        
    }
    @IBAction func relatedTagbtn(_ sender: Any) {
        let relatedTagStoryboard = UIStoryboard.init(name: "RelatedTag", bundle: nil)
        guard let relatedTagVC = relatedTagStoryboard.instantiateViewController(identifier: "RelatedTagViewController") as? RelatedTagViewController else { return }
        self.navigationController?.pushViewController(relatedTagVC, animated: true)
        relatedTagVC.goodRegisterVC = self
    }
    
    @IBAction func threeOptionBtn(_ sender: Any) {
        let threeOptionStoryboard = UIStoryboard.init(name: "threeOption", bundle: nil)
        guard let threeOptionVC = threeOptionStoryboard.instantiateViewController(identifier: "threeOptionViewController") as? threeOptionViewController else { return }
        self.navigationController?.pushViewController(threeOptionVC, animated: true)
        threeOptionVC.goodRegisterVC = self
    }
    
    
    @IBAction func registerOkayBtn(_ sender: Any) {
        
//        GoodsRegisterUserInfo.
        
        
        
        //
    }
    
    
    
    
    
    
    
    @IBAction func galleryBtn(_ sender: Any) {
        openLibrary()
        
    }
    
    
    
    
}

extension GoodsRegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated:  false, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage {
            galleryImageView.contentMode = .scaleAspectFill
            galleryImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}
