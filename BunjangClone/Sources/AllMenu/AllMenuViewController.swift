//
//  AllMenuViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/06.
//

//해야할 것
//1. 페이징킷 focusview 길이 설정

import Foundation
import UIKit
import PagingKit


class AllMenuViewController: BaseViewController {
    //MARK: - Prpperties
    //pagingkit
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
           let vc = UIViewController()
            vc.view.backgroundColor = color
            return vc
        }
        
    var dataSource = [(menu: String, content: BaseViewController)]() {
        didSet {
            menuViewController.reloadData()
            contentViewController.reloadData()
            
        }
    }
    lazy var firstLoad: (() -> Void)? = {[weak self, menuViewController, contentViewController] in
        menuViewController?.reloadData()
        contentViewController?.reloadData()
        self?.firstLoad = nil
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstLoad?()
    }
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        dataSource = makeDataSource()
        
    }
    //MARK: - Actions
    @IBAction func backHomeVCBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    //pagingkit
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
    fileprivate func makeDataSource() -> [(menu: String, content: BaseViewController)] {
         let myMenuArray = ["카테고리", "브랜드", "서비스"]
        
        return myMenuArray.map{
            let title = $0
            
            switch title {
            case "카테고리":
                let categoryVC = UIStoryboard(name: "SubMenu", bundle: nil).instantiateViewController(identifier: "CategoryViewController") as! CategoryViewController
                return (menu: title, content: categoryVC)
            case "브랜드":
                let brandVC = UIStoryboard(name: "SubMenu", bundle: nil).instantiateViewController(identifier: "BrandViewController") as! BrandViewController
                return (menu: title, content: brandVC)
            case "서비스":
                let serviceVC = UIStoryboard(name: "SubMenu", bundle: nil).instantiateViewController(identifier: "ServiceViewController") as! ServiceViewController
                return (menu: title, content: serviceVC)
                
            default:
                let categoryVC = UIStoryboard(name: "SubMenu", bundle: nil).instantiateViewController(identifier: "CategoryViewController") as! CategoryViewController
                return (menu: title, content: categoryVC)
            }
        }
    }
    
}

//메뉴 데이터소스
extension AllMenuViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 100
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menu
        return cell
    }
}

//컨텐트 데이터 소스. 내용
extension AllMenuViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].content
    }
}
// 메뉴 컨트롤 델리겟
extension AllMenuViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}
// 컨튼트 컨트롤 델리겟
extension AllMenuViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        //내용이 스크롤 되면 메뉸를 스크롤한다.
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
