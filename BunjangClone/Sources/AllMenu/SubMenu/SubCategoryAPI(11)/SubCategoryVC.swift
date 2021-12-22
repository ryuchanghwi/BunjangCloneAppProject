//
//  SubCategoryVC.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/17.
//

import Foundation
import UIKit
import Kingfisher

class SubCategoryVC : BaseViewController {
    lazy var dataManager: SubCategoryRequest = SubCategoryRequest()
    
    
    //MARK: - Properties
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    var subCategoryCell : SubCagoeryCollectionViewCell?
    
    
    var subgoods : [goodsList] = []
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        subCategoryCollectionView.delegate = self
        subCategoryCollectionView.dataSource = self
        SubCategoryRequest().getSubCategoryData(self)
        
    }
    
    
    //MARK: - Actions
    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
extension SubCategoryVC {
    func didRetrieveSubCategory(_ result: SubCategoryResult) {

        subgoods = result.goodsList
        subCategoryCollectionView.reloadData()
    }
}



extension SubCategoryVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subgoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCagoeryCollectionViewCell", for: indexPath) as? SubCagoeryCollectionViewCell else { return UICollectionViewCell()}
        let subGood = subgoods[indexPath.row]
        
        cell.subcategoryNameLabel.text = subGood.productName ?? ""
        cell.subcategoryPriceLabel.text = String(subGood.prices ?? 0)
    
        let urlString = subgoods[indexPath.row].imgUrl ?? ""
        let url = URL(string: urlString)
        let processer = DownsamplingImageProcessor(size: cell.subCategoryImageView.bounds.size)
        cell.subCategoryImageView.kf.setImage(with: url, options: [.processor(processer)])
        
        return cell
    }
    
    
}
