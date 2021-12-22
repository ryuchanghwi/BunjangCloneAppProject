//
//  SplashViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/04.
//

import Foundation
import UIKit
import PanModal
class SplashViewController: BaseViewController, UIScrollViewDelegate {
    //MARK: - Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var toEmailLoginButton: UIButton!
    @IBOutlet weak var kakaoButton: UIButton!
    
    
    var images = [ #imageLiteral(resourceName: "splashImg3"), #imageLiteral(resourceName: "splashImg4"), #imageLiteral(resourceName: "splashImg1"), #imageLiteral(resourceName: "splashImg2") ]
    var imageViews = [UIImageView]()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        addContentScrollView()
        setPageControl()
        toEmailLoginButton.layer.cornerRadius = 35
        toEmailLoginButton.layer.borderWidth = 1
        toEmailLoginButton.layer.borderColor = UIColor.black.cgColor
        kakaoButton.layer.cornerRadius = 35
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //자동로그인
//        var myJWToken : String = ""
//        myJWToken = UserDefaults.standard.value(forKey: "myJWToken") as? String ?? ""
//        print(myJWToken)
        if UserDefaults.standard.bool(forKey: "login_save") == true {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let homeNavigationVC = mainStoryboard.instantiateViewController(identifier: "HomeNavigationViewController") as? HomeNavigationViewController else { return }
        homeNavigationVC.modalPresentationStyle = .fullScreen
        present(homeNavigationVC, animated: true, completion: nil)
        }

    }
    
    
    
    
    
    
    private func addContentScrollView() {
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
    }
    
    private func setPageControl() {
        pageControl.numberOfPages = images.count
        
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
    //MARK: - LifeCycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 120, width: view.frame.size.width, height: view.frame.size.height - 70 )
    }
    
    
    //MARK: - Actions
    @IBAction func anyBtn(_ sender: Any) {
        print("anyBtn clicked")
        let vc = UIStoryboard(name: "bottomsheet", bundle: nil).instantiateViewController(withIdentifier: "BottomSheetVC") as! BottomSheetVC
        presentPanModal(vc)
        print("otherWayLoginBtn Clicked")
        
    }
    
    @IBAction func emailBtn(_ sender: UIButton) {
        print("???")
        let SelfLoginStoryboard = UIStoryboard.init(name: "SelfLogin", bundle: nil)
        guard let selfLoginVC = SelfLoginStoryboard.instantiateViewController(identifier: "SelfLoginViewController") as? SelfLoginViewController else { return }
            selfLoginVC.modalPresentationStyle = .fullScreen
            present(selfLoginVC, animated: true, completion: nil)
    }
    
    @IBAction func kakaoBtn(_ sender: Any) {
        print("카카오")
    }
    
    
}

