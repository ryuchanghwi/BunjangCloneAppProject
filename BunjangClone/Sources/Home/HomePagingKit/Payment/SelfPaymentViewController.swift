//
//  SelfPaymentViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/15.
//

import Foundation
import UIKit
import Kingfisher

class SelfPaymentViewController: BaseViewController {
    
    
    //MARK: - Properties
    //Layout
    @IBOutlet weak var bumgaePayBenefit: UIView!
    @IBOutlet weak var allPayView: UIView!
    @IBOutlet weak var otherPayToolView: UIView!
    @IBOutlet weak var payButtonView: UIButton!
    
    @IBOutlet weak var pointsView: UIView!
    
    
    @IBOutlet weak var bungaeEasyPayButton: UIButton!
    @IBOutlet weak var otherPayButton: UIButton!
    @IBOutlet weak var termsConditionsButton: UIButton!
    
    @IBOutlet weak var detailImgView: UIImageView!
    
    
    
    //API
    @IBOutlet weak var goodsImage: UIImageView!
    @IBOutlet weak var goodsPrice: UILabel!
    @IBOutlet weak var goodsPrice2: UILabel!
    @IBOutlet weak var goodsPrice3: UILabel!
    @IBOutlet weak var goodsPrice4: UILabel!
    @IBOutlet weak var goodsName: UILabel!
    
    
    //인덱스 값
    var detailgoodsIndex : Int = 0
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsView.layer.cornerRadius = 5
        pointsView.layer.borderColor = UIColor.lightGray.cgColor
        pointsView.layer.borderWidth = 0.5
        allPayView.layer.cornerRadius = 5
        allPayView.layer.borderColor = UIColor.lightGray.cgColor
        allPayView.layer.borderWidth = 0.5
        otherPayToolView.layer.cornerRadius = 5
        otherPayToolView.layer.borderWidth = 0.5
        otherPayToolView.layer.borderColor = UIColor.lightGray.cgColor
        otherPayButton.tintColor = #colorLiteral(red: 0.8431372549, green: 0.1191218272, blue: 0.09448551387, alpha: 1)
        
        //API
        detailgoodsIndex = UserDefaults.standard.value(forKey: "detailProductIdx") as? Int ?? 0
        PaymentDetailGoodsRequest().PaymentDetailGoodsData(productIdxValue: detailgoodsIndex, self)
        print(detailgoodsIndex, "상품 구매 ProductIdx값")
        
        
    }
    
    
    
    //MARK: - Actions
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //결제하기
    @IBAction func payBtn(_ sender: Any) {
        if termsConditionsButton.tintColor == UIColor.lightGray {
            presentAlert(title: "이용약관에 동의해주세요")
        }
        else {
            
            PaymentInfo.productIdx = detailgoodsIndex
            PaymentInfo.addressIdx = 0
            PaymentInfo.addressIdx = 0
            PaymentInfo.requestMsg = ""
            PaymentInfo.purchaseType = "D"
            PaymentInfo.points = 0
            
            showIndicator() //로딩나타남
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { self.dismissIndicator() //로딩해제 }
                //홈으로 이동
                let mainstoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                guard let homeNavigationVC = mainstoryboard.instantiateViewController(identifier: "HomeNavigationViewController") as? HomeNavigationViewController else { return }
                homeNavigationVC.modalPresentationStyle = .fullScreen
                self.present(homeNavigationVC, animated: true, completion: nil)

            }


            
        }
    }
    
    //결제 라디오 버튼
    @IBAction func payRadioBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            bungaeEasyPayButton.tintColor = #colorLiteral(red: 0.8445750475, green: 0.1191218272, blue: 0.09448551387, alpha: 1)
            otherPayButton.tintColor = UIColor.white
            
        }
        else if sender.tag == 2 {
            bungaeEasyPayButton.tintColor = UIColor.white
            otherPayButton.tintColor = #colorLiteral(red: 0.8445750475, green: 0.1191218272, blue: 0.09448551387, alpha: 1)
        }
        
    }
    
    
    @IBAction func termsCondotionsBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            termsConditionsButton.tintColor = UIColor.lightGray
        } else {
            sender.isSelected = true
            termsConditionsButton.tintColor = #colorLiteral(red: 0.8445750475, green: 0.1191218272, blue: 0.09448551387, alpha: 1)
        }
    }
    
    
    
}


extension SelfPaymentViewController {
    func didPaymentDetailGoodsCalled(_ response: DetailGoodsResponse) {
        goodsPrice.text = String(response.result?.prices ?? 0)
        goodsPrice2.text = String(response.result?.prices ?? 0)
        goodsPrice3.text = String(response.result?.prices ?? 0)
        goodsPrice4.text = String(response.result?.prices ?? 0)
        goodsName.text = response.result?.productName ?? ""
        
        let imageArray = response.result?.imgList?[0].imgUrl ?? ""
        let url = URL(string: imageArray)
        let processer = DownsamplingImageProcessor(size: detailImgView.bounds.size)
        detailImgView.kf.setImage(with: url, options: [.processor(processer)])

    }
}

