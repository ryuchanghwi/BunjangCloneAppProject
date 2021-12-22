//
//  HomeViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/05.
//

import Foundation
import UIKit
import PagingKit

class HomeViewController: BaseViewController {
    
    //MARK: - Pagingkit
    var HomeMenuViewController: PagingMenuViewController!
    var HomeContentViewController: PagingContentViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let vc = segue.destination as? PagingMenuViewController {
            HomeMenuViewController = vc
            HomeMenuViewController.dataSource = self
            HomeMenuViewController.delegate = self
         } else if let vc = segue.destination as? PagingContentViewController {
            HomeContentViewController = vc
            HomeContentViewController.dataSource = self
            HomeContentViewController.delegate = self
         }
     }
    static var viewController: (UIColor) -> UIViewController = { (color) in
         let vc = UIViewController()
          vc.view.backgroundColor = color
          return vc
      }
      
    var dataSource = [(menu: String, content: BaseViewController)]() {
        didSet {
            HomeMenuViewController.reloadData()
            HomeContentViewController.reloadData()
        }
    }
    fileprivate func makeDataSource() -> [(menu: String, content: BaseViewController)] {
        let myMenuArray = ["추천상품", "브랜드"]
        return myMenuArray.map{
            let title = $0
            
            switch title {
            case "추천상품" :
                let vc = UIStoryboard(name: "HomePaging", bundle: nil).instantiateViewController(identifier: "HomeRecomemedGoodsViewController") as! HomeRecomemedGoodsViewController
                return (menu: title, content: vc)
            case "브랜드":
                let vc = UIStoryboard(name: "HomePaging", bundle: nil).instantiateViewController(identifier: "HomeBrandViewController") as! HomeBrandViewController
                return (menu: title, content: vc)
            default:
                let vc = UIStoryboard(name: "HomePaging", bundle: nil).instantiateViewController(identifier: "HomeRecomemedGoodsViewController") as! HomeRecomemedGoodsViewController
                return (menu: title, content: vc)
            }
        }
    }
    
    
    //MARK: - Properties
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var bellBtn: UIButton!
    
    //자동 스크롤 구현
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    // 현재페이지 체크 변수
    var nowPage: Int = 0
    let dateArray: Array<UIImage> = [UIImage(named: "banner1.png")!, UIImage(named: "banner2.png")!, UIImage(named: "banner3.png")!, UIImage(named: "banner4.png")!, UIImage(named: "banner5.png")!, UIImage(named: "banner6.png")!, UIImage(named: "banner7.png")!, UIImage(named: "banner8.png")!, UIImage(named: "banner9.png")! ,UIImage(named: "banner10.png")!]
    //타이머 설정
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { (Timer) in
            self.bannerMove()
        })
    }
    //배너 움직이기 매소드
    func bannerMove() {
        //현재페이지가 마지막일 경우
        if nowPage == dateArray.count - 1 {
            //맨 처음으로 돌아감
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        //다음 페이지 전환
        nowPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //pagingkit
        HomeMenuViewController.register(nib: UINib(nibName: "HomeMenuCell", bundle: nil), forCellWithReuseIdentifier: "HomeMenuCell")
        HomeMenuViewController.registerFocusView(nib: UINib(nibName: "HomeFocusView", bundle: nil))
        HomeMenuViewController.reloadData()
        HomeContentViewController.reloadData()
        dataSource = makeDataSource()
        
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerTimer()
        homeScrollView.delegate = self
    }
    
    
    
    
    //MARK: - Actions
    @IBAction func menuButton(_ sender: Any) {
        let allMenuStoryboard = UIStoryboard.init(name: "AllMenu", bundle: nil)
        guard let allMenuVC = allMenuStoryboard.instantiateViewController(identifier: "AllMenuViewController") as? AllMenuViewController else { return }
        allMenuVC.modalPresentationStyle = .fullScreen
        present(allMenuVC, animated: true, completion: nil)
    }
    
    
    @IBAction func homeNikeBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "bottomsheet", bundle: nil).instantiateViewController(withIdentifier: "BottomSheetVC") as! BottomSheetVC
        presentPanModal(vc)
    }
    
    @IBAction func bellButton(_ sender: Any) {
        let BellStoryboard = UIStoryboard.init(name: "Bell", bundle: nil)
        let BellVC = BellStoryboard.instantiateViewController(identifier: "BellViewController")
        self.navigationController?.pushViewController(BellVC, animated: true)
    }
    
    

    
     //스크롤했을 때 상단view의 색상을 바꿔야함
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if homeScrollView.contentOffset.y == 468 {
            homeScrollView.bounces = false
            
        }
        
        var offset = homeScrollView.contentOffset.y / 100

        if offset > 1 {
            offset = 1
            upperView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            menuBtn.setImage(UIImage(named: "menuIconImg.png"), for: .normal)
            searchBtn.setImage(UIImage(named: "searchIconImg"), for: .normal)
            bellBtn.setImage(UIImage(named: "bellIconImg"), for: .normal)
        }
        else {
            upperView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            menuBtn.setImage(UIImage(named: "menuW"), for: .normal)
            searchBtn.setImage(UIImage(named: "searchW"), for: .normal)
            bellBtn.setImage(UIImage(named: "bellW"), for: .normal)
        }
    }
}

    
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateArray.count
    }
    // 컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.scrollImgView.image = dateArray[indexPath.row]
        return cell
    }
    // UICollectionViewDelegateFlowLayout상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width, height: bannerCollectionView.frame.size.height)
    }
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(bannerCollectionView.contentOffset.x) / Int(bannerCollectionView.frame.width)
    }
    
    
}


//MARK: - PagingKit
extension HomeViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 100
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "HomeMenuCell", for: index) as! HomeMenuCell
        cell.titleLabel.text = dataSource[index].menu
        return cell
    }
}
extension HomeViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].content
    }
}
extension HomeViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        HomeContentViewController.scroll(to: page, animated: true)
    }
}
extension HomeViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        HomeMenuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
