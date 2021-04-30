//
//  OrderViewCell.swift
//  CanteenNIBM
//
//  Created by Ravindu Liyanage on 4/29/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import UIKit

class OrderViewCell: UITableViewCell {
    @IBOutlet weak var nametxt: UILabel!
    @IBOutlet weak var pricetxt: UILabel!
    var accpt:(() -> Void)? = nil
    var rjct:(() -> Void)? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func accTap(_ sender: Any) {
        
        accpt?()
        
    }
    @IBAction func accRej(_ sender: Any) {
        
        rjct?()
    }
    
}
