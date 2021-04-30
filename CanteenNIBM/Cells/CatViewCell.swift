//
//  CatViewCell.swift
//  CanteenNIBM
//
//  Created by Ravindu Liyanage on 4/29/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import UIKit
import Firebase

class CatViewCell: UITableViewCell {
    var act:(() -> Void)? = nil
    @IBOutlet weak var catlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(with cat : Cat)
    {
    
        
    }
   
    @IBAction func delTap(_ sender: Any) {
       act?()
        
    }
}
