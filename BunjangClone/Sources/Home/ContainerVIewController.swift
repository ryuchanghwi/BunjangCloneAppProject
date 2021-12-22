//
//  ContainerVIewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/05.
//

import Foundation
import UIKit

class ContainerViewController: BaseViewController {
    //MARK: - Properties
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var talkView: UIView!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var talkBtn: UIButton!
    @IBOutlet weak var myBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeBtn.isSelected = true
        homeView.alpha = 1
        talkView.alpha = 0
        myView.alpha = 0
    }
    @IBAction func radioButton(_ sender: UIButton) {
        if sender.tag == 1 {
            homeBtn.isSelected = true
            talkBtn.isSelected = false
            myBtn.isSelected = false
            homeView.alpha = 1
            talkView.alpha = 0
            myView.alpha = 0
        }
        else if sender.tag == 2 {
            homeBtn.isSelected = false
            talkBtn.isSelected = true
            myBtn.isSelected = false
            homeView.alpha = 0
            talkView.alpha = 1
            myView.alpha = 0
            
        }
        else if sender.tag == 3 {
            homeBtn.isSelected = false
            talkBtn.isSelected = false
            myBtn.isSelected = true
            homeView.alpha = 0
            talkView.alpha = 0
            myView.alpha = 1
        }
    }
    @IBAction func registerBtn(_ sender: Any) {

        let goodsRegisterStoryboard = UIStoryboard.init(name: "goodsRegister", bundle: nil)
        let goodsVC = goodsRegisterStoryboard.instantiateViewController(identifier: "GoodsRegisterViewController")
        self.navigationController?.pushViewController(goodsVC, animated: true)
    }
    @IBAction func talkBtn(_ sender: Any) {
    }
    @IBAction func searchBtn(_ sender: Any) {
        let searchStoryboard = UIStoryboard.init(name: "Search", bundle: nil)
        let searchVC = searchStoryboard.instantiateViewController(identifier: "SearchViewController")
        self.navigationController?.pushViewController(searchVC, animated: true)
        
    }
    
    
    
    
}
