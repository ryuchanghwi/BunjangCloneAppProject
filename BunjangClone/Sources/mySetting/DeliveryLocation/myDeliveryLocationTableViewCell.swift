//
//  myDeliveryLocationTableViewCell.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/16.
//

import UIKit

class myDeliveryLocationTableViewCell: UITableViewCell {
    @IBOutlet weak var deliveryLocationAddressLabel: UILabel!
    @IBOutlet weak var deliveryLocationNameLabel: UILabel!
    @IBOutlet weak var deliveryLocationPhoneLabel: UILabel!
    @IBOutlet weak var deliveryLocationRequestLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
