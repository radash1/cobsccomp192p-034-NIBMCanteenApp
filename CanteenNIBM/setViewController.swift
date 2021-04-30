//
//  setViewController.swift
//  CanteenNIBM
//
//  Created by Ravindu Liyanage on 4/30/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import UIKit

class setViewController: UIViewController {
    
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func switchView(_ sender: UISegmentedControl)
    {
        
        if sender.selectedSegmentIndex == 0
        {
            firstView.alpha = 1
            secondView.alpha = 0
            thirdView.alpha = 0
        }
        if sender.selectedSegmentIndex == 1
        {
            firstView.alpha = 0
            secondView.alpha = 1
            thirdView.alpha = 0
        }
        if sender.selectedSegmentIndex == 2
        {
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 1
        }
        
    }

}
