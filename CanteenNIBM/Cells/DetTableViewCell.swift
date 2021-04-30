//
//  DetTableViewCell.swift
//  CanteenNIBM
//
//  Created by Ravindu Liyanage on 4/30/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import UIKit

class DetTableViewCell: UITableViewCell {
    @IBOutlet weak var price1: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var item2lbl: UILabel!
    @IBOutlet weak var item1txt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
