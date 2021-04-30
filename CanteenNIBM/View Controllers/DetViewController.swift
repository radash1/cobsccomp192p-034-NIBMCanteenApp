//
//  DetViewController.swift
//  CanteenNIBM
//
//  Created by Ravindu Liyanage on 4/30/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import UIKit

class DetViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var wow: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nametxt: UILabel!
    
    var nm = ""
    var it : [Any] = []
    var s: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nametxt.text = nm
//        guard let x = it[0] as? [String : Any] else {return}
//        guard let names = x["name"] as? String else {return}
//        print(names)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        self.navigationItem.title = "olist"
        // Do any additional setup after loading the view.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(it.count)
               return it.count
            
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              
               let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetTableViewCell
               let Category = it[indexPath.row]
    //
            cell.price1.text = (Category as AnyObject).name
            print()
            return cell
               
           }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
