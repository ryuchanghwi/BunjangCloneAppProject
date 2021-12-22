//
//  HomeMenuViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/07.
//

import Foundation
import UIKit
import Kingfisher

class HomeRecomemedGoodsViewController: BaseViewController {
    lazy var dataManager: GoodsRequest = GoodsRequest()
    
    var goodsRequestCell: goodRequestCollectionViewCell?
    
    // 여기에 세그웨이 만들기
    
    var goods : [goodsResult] = [] // ??
    var goodsImgList : [imgList] = []
    var goodsTagList : [tagList] = []

    
    //MARK: - Preperties
    @IBOutlet weak var goodsInquiryCollectionView: UICollectionView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        goodsInquiryCollectionView.delegate = self
        goodsInquiryCollectionView.dataSource = self
        GoodsRequest().GoodsData(self)
        
    }
    
    
    //MARK: - Actions
}


//MARK: - Extentions
extension HomeRecomemedGoodsViewController {
    func didRetrieveGoods(_ result: GoodsResponse) {
        goods = result.result
        goodsInquiryCollectionView.reloadData()
    }
    
}

extension HomeRecomemedGoodsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goodRequestCollectionViewCell", for: indexPath) as? goodRequestCollectionViewCell else { return UICollectionViewCell() }
        let good = goods[indexPath.row]
        

        cell.goodsNameLabel.text = good.productName ?? ""
        cell.goodsPriceLabel.text = String(good.prices ?? 0)
   //     cell.goodsSubscribeButton
        cell.goodsSubscribeCountLabel.text = String(good.cntLikes ?? 0)
    //    cell.goodsPayImageView
        cell.goodsLocationLabel.text = good.areaName ?? ""
        cell.goodsTimeDataLabel.text = good.createdAt ?? ""

        if let imageArray = goods[indexPath.row].imgList {
            let urlString = imageArray[0].imgUrl ?? ""
            let url = URL(string: urlString)
            let processer = DownsamplingImageProcessor(size: cell.goodsImageView.bounds.size)
            cell.goodsImageView.kf.setImage(with: url, options: [.processor(processer)])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print(indexPath.row)
        print(goods[indexPath.row].productIdx!, "클릭한 productIdx 값")
        
        let homePagingstoryboard = UIStoryboard.init(name: "HomePaging", bundle: nil)
        let DetailGoodsVC = homePagingstoryboard.instantiateViewController(identifier: "DetailGoodsViewController")
        self.navigationController?.pushViewController(DetailGoodsVC, animated: true)
        
        //조회할 상품 데이터 저장
        UserDefaults.standard.set(goods[indexPath.row].productIdx!, forKey: "detailProductIdx")
        
        
        
        
    }
    
}
