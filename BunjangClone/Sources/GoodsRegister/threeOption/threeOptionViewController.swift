//
//  threeOptionViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/12.
//

import Foundation
import UIKit

class threeOptionViewController : BaseViewController, threeOptionDelegate, UITextFieldDelegate {
    func changeOptionLabel() {
        goodRegisterVC?.goodsCountLabel.text = countTextfield.text
        goodRegisterVC?.newOrOldGooldsLabel.text = oldOrNewLabel
        goodRegisterVC?.exchangeLabel.text = exchangeLabel
        goodRegisterVC?.goodsCountLabel.textColor = UIColor.black
        goodRegisterVC?.newOrOldGooldsLabel.textColor = UIColor.black
        goodRegisterVC?.exchangeLabel.textColor = UIColor.black
    }
    
    //MARK: - Properties
    @IBOutlet weak var countTextfield: UITextField!
    @IBOutlet weak var oldGoodsButton: UIButton!
    @IBOutlet weak var newGoddsButton: UIButton!
    @IBOutlet weak var exchangeXButton: UIButton!
    @IBOutlet weak var exchangeOButton: UIButton!
    
    var goodRegisterVC : GoodsRegisterViewController?
    var oldOrNewLabel : String = "중고상품" //초기값
    var exchangeLabel : String = "교환불가" //초기값
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        oldGoodsButton.isSelected = true
        exchangeXButton.isSelected = true
        countTextfield.delegate = self
        
    }
    
    
    //MARK: - Actions
    
    //상태 라디오 버튼
    @IBAction func stateBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            oldGoodsButton.isSelected = true
            newGoddsButton.isSelected = false
            oldGoodsButton.tintColor = #colorLiteral(red: 1, green: 0.4097604156, blue: 0.4096620679, alpha: 1)
            newGoddsButton.tintColor = UIColor.lightGray
            oldOrNewLabel = "중고상품"
            goodRegisterVC?.goodsConditions = "U"
        }
        if sender.tag == 2 {
            oldGoodsButton.isSelected = false
            newGoddsButton.isSelected = true
            oldGoodsButton.tintColor = UIColor.lightGray
            newGoddsButton.tintColor = #colorLiteral(red: 1, green: 0.4097604156, blue: 0.4096620679, alpha: 1)
            oldOrNewLabel = "새상품"
            goodRegisterVC?.goodsConditions = "N"
        }
    }
    
    //교환 라디오 버튼
    @IBAction func exchangeBtn(_ sender: UIButton) {
        if sender.tag == 1 {
            exchangeXButton.isSelected = true
            exchangeOButton.isSelected = false
            exchangeXButton.tintColor = #colorLiteral(red: 1, green: 0.4097604156, blue: 0.4096620679, alpha: 1)
            exchangeOButton.tintColor = UIColor.lightGray
            exchangeLabel = "교환불가"
            goodRegisterVC?.goodsExchange = "N"
            
        }
        if sender.tag == 2 {
            exchangeXButton.isSelected = false
            exchangeOButton.isSelected = true
            exchangeXButton.tintColor = UIColor.lightGray
            exchangeOButton.tintColor = #colorLiteral(red: 1, green: 0.4097604156, blue: 0.4096620679, alpha: 1)
            exchangeLabel = "교환가능"
            goodRegisterVC?.goodsExchange = "Y"
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        changeOptionLabel()

        
    }
    
    
    
    
}
