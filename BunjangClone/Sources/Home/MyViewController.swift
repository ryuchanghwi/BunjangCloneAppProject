//
//  MyViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/05.
//

import Foundation
import UIKit
import SafariServices
import PagingKit

class MyViewController: UIViewController {
    //Paging Kit
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
       let vc = UIViewController()
        vc.view.backgroundColor = color
        return vc
    }
    

    
    var dataSource = [(menu: String, content: UIViewController)]() {
        didSet {
            menuViewController.reloadData()
            contentViewController.reloadData()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController.dataSource = self
            menuViewController.delegate = self
        } else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
            contentViewController.dataSource = self
            contentViewController.delegate = self
        }
    }
    
    
    fileprivate func makeDataSource() -> [(menu: String, content: UIViewController)] {
        let myMenuArray = ["판매중", "예약중", "판매완료"]
        
        return myMenuArray.map{
            let title = $0
            
            switch title {
            case "판매중":
                let vc = UIStoryboard(name: "MyViewSub", bundle: nil).instantiateViewController(identifier: "OnSaleVC") as! OnSaleVC
                return (menu: title, content: vc)
            case "예약중":
                let vc = UIStoryboard(name: "MyViewSub", bundle: nil).instantiateViewController(identifier: "ReservingVC") as! ReservingVC
                return (menu: title, content: vc)
            case "판매완료":
                let vc = UIStoryboard(name: "MyViewSub", bundle: nil).instantiateViewController(identifier: "SoldOutVC") as! SoldOutVC
                return (menu: title, content: vc)
            default:
                let vc = UIStoryboard(name: "MyViewSub", bundle: nil).instantiateViewController(identifier: "OnSaleVC") as! OnSaleVC
                return (menu: title, content: vc)
            }
        }
    }
    
    
    
    
    //MARK: - Properties
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileStarImg: UIImageView!
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //pagingkit
        menuViewController.register(nib: UINib(nibName: "MyViewMenuCell", bundle: nil), forCellWithReuseIdentifier: "MyViewMenuCell")
        menuViewController.registerFocusView(nib: UINib(nibName: "MyViewFocusView", bundle: nil))
        menuViewController.reloadData()
        contentViewController.reloadData()
        
        dataSource = makeDataSource()
    }
    
    
    //MARK: - Actions
    @IBAction func myProfileBtn(_ sender: Any) {
        let storeSettingBSVC = UIStoryboard(name: "StoreSettingBottomsheet", bundle: nil).instantiateViewController(withIdentifier: "StoreSettingBottonsheetVC") as! StoreSettingBottonsheetVC
        presentPanModal(storeSettingBSVC)
    }
    @IBAction func myCertifiedBtn(_ sender: Any) {
    }
    @IBAction func storeQuestion(_ sender: Any) {
    }
    @IBAction func ADSafariBtn(_ sender: Any) {
        let blogUrl = NSURL(string: "https://www.britymail.com/static/employee/freemium/html/brityworksServiceInfo.html?locale=ko&utm_source=kakaomoment&utm_medium=display&utm_campaign=brityworks&utm_content=b")
        let blogView: SFSafariViewController = SFSafariViewController(url: blogUrl! as URL)
        self.present(blogView, animated: true, completion: nil)
    }
    @IBAction func mySettingBtn(_ sender: Any) {
        let mySettingStoryboard = UIStoryboard.init(name: "MySetting", bundle: nil)
        let MySettingVC = mySettingStoryboard.instantiateViewController(identifier: "MySettingViewController")
        self.navigationController?.pushViewController(MySettingVC, animated: true)
    }
    
    
}


//메뉴 데이터 소스
extension MyViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 100
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MyViewMenuCell", for: index) as! MyViewMenuCell
        cell.titleLabel.text = dataSource[index].menu
        return cell
    }
}

// 컨텐트 데이터 소스 -내용
extension MyViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].content
    }
}
extension MyViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}
extension MyViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
