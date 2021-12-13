//
//  HomeMenuViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/07.
//

import Foundation
import UIKit

class HomeRecomemedGoodsViewController: BaseViewController, UIScrollViewDelegate {
    @IBOutlet weak var recommendGoodsScrollView: UIScrollView!
    
    var homeVC = HomeViewController?.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendGoodsScrollView.delegate = self
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if recommendGoodsScrollView.contentOffset.y == 0 {
            recommendGoodsScrollView.bounces = false
            
        }
    }
}
