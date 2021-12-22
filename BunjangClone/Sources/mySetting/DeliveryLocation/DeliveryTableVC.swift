//
//  DeliveryTableVC.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/16.
//

import Foundation
import UIKit

class DeliveryTableVC : BaseViewController {
    var myDeliveryLocationCell : myDeliveryLocationTableViewCell?
    var mySettingIdx : Int = 0
    var AllAddress : [AllAddressResult] = []
    
    lazy var dataManager: AllAddressRequest = AllAddressRequest()
    
    //MARK - Properties
    @IBOutlet weak var myDeliveryLocationTableView: UITableView!

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        myDeliveryLocationTableView.delegate = self
        myDeliveryLocationTableView.dataSource = self
        mySettingIdx = UserDefaults.standard.value(forKey: "myIdx") as? Int ?? 0
        AllAddressRequest().getAllAddressData(IdxValue: mySettingIdx, viewController: self)
    }
    
    
    //MARK: - Actions
    @IBAction func addBtn(_ sender: Any) {
        guard let deliveryAddVC = self.storyboard?.instantiateViewController(identifier: "DeliveryAddViewController") else { return }
        self.navigationController?.pushViewController(deliveryAddVC, animated: true)
    }
    
}
//API
extension DeliveryTableVC {
    func didSuccess(_ response: AllAddressResponse) {
        AllAddress = response.result
        myDeliveryLocationTableView.reloadData()
    }
}



extension DeliveryTableVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllAddress.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myDeliveryLocationTableViewCell", for: indexPath) as? myDeliveryLocationTableViewCell else { return UITableViewCell()}
        let myAddress = AllAddress[indexPath.row]
        cell.deliveryLocationNameLabel.text = myAddress.recipient ?? ""
        cell.deliveryLocationPhoneLabel.text = myAddress.phone ?? ""
        cell.deliveryLocationAddressLabel.text = myAddress.roadName ?? ""
        cell.deliveryLocationRequestLabel.text = myAddress.requestMsg ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}
