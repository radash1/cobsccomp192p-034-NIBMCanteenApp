//
//  OrderViewController.swift
//  CanteenNIBM
//
//  Created by Ravindu Liyanage on 4/29/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import UIKit
import Firebase

class OrderViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
         var catagory: [Ord] = []
        var test: [Ord] = []
    let db = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    var sat = ""
        override func viewDidLoad() {
            super.viewDidLoad()

            loadData()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 80
            self.navigationItem.title = "olist"
           
        }
        func loadData(){
               
                          db.collection("Orders").addSnapshotListener { (snap, err) in
                          
                              if err != nil{
                                  
                                  print((err?.localizedDescription)!)
                                  return
                              }
                              
                              for i in snap!.documentChanges{
                                  
                                
                                let name = i.document.get("cus_name") as! String
                                let price = i.document.get("price") as! String
                                let status = i.document.get("status") as! Int
                                let item = i.document.get("Items") as! Any
    
                               
                        
                                if status == 1
                                {
                                   
                                    self.catagory.append(Ord(name: name,price: price,stat : status,item: [item]))
                                }
                                else if status == 2
                                {
                                    
                                    self.test.append(Ord(name: name,price: price,stat : status,item: [item]))
                                }
                                
                                
                              }
                           
                           self.tableView.reloadData()
                           
                          }
                   
                   
                   
               }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let label2 = UILabel()
        label.text = "other"
        label2.text = "Header"
        label.backgroundColor = UIColor.lightGray
         label2.backgroundColor = UIColor.lightGray
        if section == 0{
                       return label2
                   }
                  return label
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0{
                return catagory.count
            }
            return test.count
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OrderViewCell
            let Category = indexPath.section == 0 ? catagory[indexPath.row] : test[indexPath.row]
            cell.nametxt.text = Category.name
            cell.pricetxt.text = "Rs.\(Category.price)"
            
            cell.accpt = {
                
             
                self.loadData()
                        
                       
                   }
            cell.rjct = {
                           
                           self.loadData()
                                   
                                  
                              }
            
            return cell
         }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         
         
        
         let vc = storyboard?.instantiateViewController(withIdentifier: "Det") as? DetViewController
         
         vc?.nm = catagory[indexPath.row].name
         vc?.it = catagory[indexPath.row].item
         navigationController?.pushViewController(vc!, animated: true)
    }

    }

    struct Ord {
        var name : String
        var price : String
        var stat : Int
        var item : [Any] = []
    }


