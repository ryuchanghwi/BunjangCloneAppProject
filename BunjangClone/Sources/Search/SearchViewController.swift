//
//  LocationViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/09.
//

import Foundation
import UIKit

class SearchViewController: BaseViewController {
    
    //MARK: - Properties
    @IBOutlet var muchSearchListButton: UIButton!
    @IBOutlet weak var searchBtn01: UIButton!
    @IBOutlet weak var searchBtn02: UIButton!
    @IBOutlet weak var searchBtn03: UIButton!
    @IBOutlet weak var searchBtn04: UIButton!
    @IBOutlet weak var searchBtn05: UIButton!
    @IBOutlet weak var searchBtn06: UIButton!
    @IBOutlet weak var searchBtn07: UIButton!
    @IBOutlet weak var searchBtn08: UIButton!
    @IBOutlet weak var searchBtn09: UIButton!
    @IBOutlet weak var searchBtn10: UIButton!
    @IBOutlet weak var NikeFollowBtn: UIButton!
    @IBOutlet weak var stoneIslandBtn: UIButton!
    @IBOutlet weak var newBalanceBtn: UIButton!
    @IBOutlet weak var AdidasBtn: UIButton!
    @IBOutlet weak var northFaceBtn: UIButton!
    @IBOutlet weak var brandAllLookBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBtn01.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn02.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn03.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn04.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn05.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn01.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn06.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn07.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn08.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn09.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        searchBtn10.setLayer(color: UIColor.lightGray.cgColor, width: CGFloat(1), radius: CGFloat(3))
        NikeFollowBtn.layer.cornerRadius = 3
        stoneIslandBtn.layer.cornerRadius = 3
        newBalanceBtn.layer.cornerRadius = 3
        AdidasBtn.layer.cornerRadius = 3
        northFaceBtn.layer.cornerRadius = 3
        brandAllLookBtn.layer.cornerRadius = 3
        
        
        
    }
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func homeBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
