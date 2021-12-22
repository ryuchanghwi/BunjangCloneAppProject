//
//  SearchViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/09.
//

import Foundation
import UIKit
import Alamofire

class LocationViewController: BaseViewController {
    
    var GoodsRegisterVC : GoodsRegisterViewController?
    
    lazy var dataManager: LocationRequest = LocationRequest()
    //API
    var locationItems: [items] = []
    
    
//    var locationAdress: loca
    
    
    
    @IBOutlet weak var locationSearchTextfield: UITextField!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var locationTableView: UITableView!
//    var locationqueryValue: String = ""
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        locationSearchTextfield.delegate = self
        locationTableView.alpha = 0
        locationTableView.delegate = self
        locationTableView.dataSource = self
        GoodsRegisterVC?.changeLocationLabeldelegate = self
    }
    

    
    
    
    //MARK: - Actions
    @IBAction func searchButton(_ sender: Any) {
        
    }
    
}

//MARK: - API
extension LocationViewController {
    func didRetrieveLocation(result: LocationResponse) {
        locationItems = result.items
//        locationItems = result.items
        locationTableView.reloadData()
    }
}

extension LocationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // return 누르면 내리기
        locationSearchTextfield.resignFirstResponder()
        //테이블뷰 보이게
//        locationTableView.alpha = 1
        //API
        let LocationqueryValue: String = locationSearchTextfield.text!
//        LocationRequest().getLocationData(self)
        
        dataManager.getLocationData(queryValue: LocationqueryValue, self)
        if LocationResult.LocationSearchState == true {
            locationTableView.alpha = 1
        } else {
            locationTableView.alpha = 0
        }
        return true
    }
}

extension LocationViewController: UITableViewDelegate, UITableViewDataSource, locationDelegate {
    func changeLocationLabel() {
//        GoodsRegisterVC?.locationLabel.text = LocationTableViewCell.adre
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as? LocationTableViewCell else { return UITableViewCell() }
        //배경 회색으로 보이지 않게 하기
//        cell.selectionStyle = .none
        let location = locationItems[indexPath.row]
        cell.adressname.text = location.roadAddress
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        locationTableView.deselectRow(at: indexPath, animated: true)
        let clickedAddress = locationItems[indexPath.row].roadAddress
        changeLocationLabel()
        print("클릭된 셀 \(clickedAddress!)")
        navigationController?.popViewController(animated: true)
    }
    
}





class LocationTableViewCell: UITableViewCell {
    @IBOutlet weak var adressname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
