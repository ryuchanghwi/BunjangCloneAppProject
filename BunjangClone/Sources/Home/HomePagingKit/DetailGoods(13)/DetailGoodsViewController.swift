//
//  DetailGoodsViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/14.
//

import Foundation
import UIKit
import Kingfisher
import SafariServices



class DetailGoodsViewController : BaseViewController, UIScrollViewDelegate {
    lazy var dataManater: DetailGoodsRequest = DetailGoodsRequest()

    var goodsImgList : [detailImgList] = []
    var goodsTagLIst : [detailTagList] = []
    
    
    
    
    //MARK: - Properties
    @IBOutlet weak var DetailImgScrollView: UIScrollView!
    @IBOutlet weak var detailPageControl: UIPageControl!
    @IBOutlet weak var detailScrollView: UIScrollView!
    @IBOutlet weak var upperChangedView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var goodsInfoLabel: UILabel!
    @IBOutlet weak var bottomView: UIView! //테두리
    @IBOutlet weak var bottomHeartView: UIButton! //테두리
    @IBOutlet weak var eventView: UIView!
    
    
    
    
    @IBOutlet weak var detailImgView: UIImageView!
    
    
    //API에 필요한 것들
    @IBOutlet weak var detailPriceLabel: UILabel!
    @IBOutlet weak var detailBunjangPayImgView: UIImageView!
    @IBOutlet weak var detailSafeLabel: UILabel!
    @IBOutlet weak var detailGoodLabel: UILabel!
    @IBOutlet weak var detailTimeLabel: UILabel!
    @IBOutlet weak var detailLookedLabel: UILabel!
    @IBOutlet weak var detailHeartlLabel: UILabel!
    @IBOutlet weak var detailLocationLabel: UILabel!
    @IBOutlet weak var detailOldOrNewGoodsLabel: UILabel!
    @IBOutlet weak var detailFreeOrPayShippingLabel: UILabel!
    @IBOutlet weak var detailGoodsCountLabel: UILabel!
    @IBOutlet weak var detailExplanationLabel: UILabel!
    @IBOutlet weak var detailSubCategoryLabel: UILabel!
    @IBOutlet weak var detailTagNameLabel: UILabel!
    @IBOutlet weak var detailStoreNameLabel: UILabel!
    
    @IBOutlet weak var detailCntFollowers: UILabel!
    
    
    //이미지 데이터 배열
    var detailImages = [ #imageLiteral(resourceName: "splashImg3"), #imageLiteral(resourceName: "splashImg4"), #imageLiteral(resourceName: "splashImg1"), #imageLiteral(resourceName: "splashImg2") ]
    var detailImageList : [UIImage] = []
    var detailImageView = [UIImageView]()
    var detailProductIndex : Int = 0
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addContentScrollView()
        setPageControl()
        bottomView.layer.borderWidth = 0.5
        bottomView.layer.borderColor = UIColor.lightGray.cgColor
        bottomHeartView.layer.borderColor = UIColor.lightGray.cgColor
        bottomHeartView.layer.borderWidth = 0.5
        //API
        detailProductIndex = UserDefaults.standard.value(forKey: "detailProductIdx") as? Int ?? 0
        DetailGoodsRequest().DetailGoodsData(productIdxValue: detailProductIndex, self)
        print(detailProductIndex, "디테일 굿즈 뷰 조회 productidx값")
        eventView.layer.borderColor = UIColor.lightGray.cgColor
        eventView.layer.borderWidth = 0.7
        eventView.layer.cornerRadius = 5
        detailScrollView.delegate = self
        
    }
    private func addContentScrollView() {
        for i in 0..<detailImageList.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: DetailImgScrollView.bounds.width, height: DetailImgScrollView.bounds.height)
            imageView.image = detailImages[i]
            DetailImgScrollView.addSubview(imageView)
            DetailImgScrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
    }
    
    private func setPageControl() {
        detailPageControl.numberOfPages = detailImages.count
        
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        detailPageControl.currentPage = currentPage
    }
    
    
    //스크롤했을 때 상단view 색상 바꾸기
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(detailScrollView.contentOffset.y) //100일때
        var offset = detailScrollView.contentOffset.y / 100
        if offset > 1 {
            offset = 1
            upperChangedView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            backButton.tintColor = UIColor.black
            searchButton.tintColor = UIColor.black
            shareButton.tintColor = UIColor.black
            goodsInfoLabel.tintColor = UIColor.black
            goodsInfoLabel.alpha = 1
            
            
        }
        else {
            upperChangedView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            backButton.tintColor = UIColor.white
            searchButton.tintColor = UIColor.white
            shareButton.tintColor = UIColor.white
            goodsInfoLabel.alpha = 0
            
        }
        
        

    }

    
    
    //MARK: - Actions
    @IBAction func backbtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func paySafeBuyBtn(_ sender: Any) {
        let homeSubBottomVC = UIStoryboard(name: "HomeSubBottomsheet", bundle: nil).instantiateViewController(identifier: "HomeSubBottomsheetVC") as! HomeSubBottomsheetVC
        presentPanModal(homeSubBottomVC)
    }
    
    @IBAction func uniBtn(_ sender: Any) {
        let blogUrl = NSURL(string: "https://home.sjcu.ac.kr/ko/department/department-manage-roadmap.do#none?utm_campaign=SPRING_2022UNIV&utm_medium=DA&utm_source=KAKAO_MO&utm_content=BUSINESS")
        let blogView: SFSafariViewController = SFSafariViewController(url: blogUrl! as URL)
        self.present(blogView, animated: true, completion: nil)
        
    }
    
    @IBAction func clothesBtn(_ sender: Any) {
        let blogUrl = NSURL(string: "https://mobile.galleria.co.kr/goods/initDetailGoods.action?goods_no=2110272505&channel_code=VC010001&disp_lctg_no=1910020224&nv_ad=pla&n_media=98128&n_query=%EA%B2%A8%EC%9A%B8%EC%BD%94%ED%8A%B8&n_rank=1&n_ad_group=grp-a001-02-000000021780344&n_ad=nad-a001-02-000000159000327&n_campaign_type=2&n_mall_id=galleria&n_mall_pid=2110272505&n_ad_group_type=2&NaPm=ct%3Dkx9nlp1s%7Cci%3D0zC0003-QpHvG13bGfnp%7Ctr%3Dpla%7Chk%3D91b054974df9179ab06df40322e9aeba97fb4ca8")
        let blogView: SFSafariViewController = SFSafariViewController(url: blogUrl! as URL)
        self.present(blogView, animated: true, completion: nil)
        
    }
    
    
}


//API
extension DetailGoodsViewController {
    func didDetailGoodsCalled(_ response: DetailGoodsResponse) {
        

        detailGoodLabel.text = response.result?.productName ?? ""
        

        detailPriceLabel.text = String(response.result?.prices ?? 0)
        detailLocationLabel.text = response.result?.areaName ?? ""
        detailTimeLabel.text = response.result?.createdAt ?? ""
        detailHeartlLabel.text =  String(response.result?.cntLikes ?? 0)
        detailExplanationLabel.text = response.result?.content ?? ""
        detailSubCategoryLabel.text = response.result?.subcategoryName ?? ""
        detailTagNameLabel.text = response.result?.tagList?[0].tagName ?? ""
        detailStoreNameLabel.text = response.result?.storeName ?? ""
        detailOldOrNewGoodsLabel.text = response.result?.conditions ?? ""
        if response.result?.conditions == "U" {
            detailOldOrNewGoodsLabel.text = "중고상품"
            }
        else if response.result?.conditions == "N" {
                detailOldOrNewGoodsLabel.text = "새상품"
        }
        detailSafeLabel.text = response.result?.safePayment ?? ""
        if response.result?.safePayment == "Y" {
            detailSafeLabel.text = "안전"
        }
        else if response.result?.safePayment == "N" {
            detailSafeLabel.text = " "
        }
        detailFreeOrPayShippingLabel.text = response.result?.freeShipping ?? ""
        if response.result?.freeShipping == "Y" {
            detailFreeOrPayShippingLabel.text = "배송비 무료"
        } else if response.result?.freeShipping == "N" {
            detailFreeOrPayShippingLabel.text = "배송비 별도"
        }
        detailGoodsCountLabel.text = String(response.result?.quantity ?? 0)
        detailCntFollowers.text = String(response.result?.cntFollowers ?? 0)
        let imageArray = response.result?.imgList?[0].imgUrl ?? ""
        let url = URL(string: imageArray)
        let processer = DownsamplingImageProcessor(size: detailImgView.bounds.size)
        detailImgView.kf.setImage(with: url, options: [.processor(processer)])
   
        
        
        
        
        

        
    }
}


