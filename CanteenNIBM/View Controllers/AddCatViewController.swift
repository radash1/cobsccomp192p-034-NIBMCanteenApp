//
//  AddCatViewController.swift
//  CanteenNIBM
//
//  Created by Ravindu Liyanage on 4/29/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import UIKit
import Firebase

class AddCatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var wow: UIView!
    @IBOutlet weak var cattxt: UITextField!
    @IBOutlet weak var errlbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    var catagory: [Cat] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        wow.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pin(to: wow)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        self.navigationItem.title = "CAT"

        
    }
    
    func loadData(){
            
                   
                   db.collection("Category").addSnapshotListener { (snap, err) in
                    self.catagory.removeAll()
                       if err != nil{
                           
                           print((err?.localizedDescription)!)
                           return
                       }
                       
                       for i in snap!.documentChanges{
                           
                         
                           let name = i.document.get("name") as! String
                        
                        self.catagory.append(Cat(name: name))
                       }
                 
                    self.tableView.reloadData()
                    
                   }
            
            
            
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
           return catagory.count
        
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CatViewCell
           let Category = catagory[indexPath.row]
//
        cell.catlbl.text = Category.name
        cell.act = {
            self.db.collection("Category").whereField("name", isEqualTo: Category.name).getDocuments() { (querySnapshot, err) in
              if let err = err {
                print("Error getting documents: \(err)")
              } else {
                for document in querySnapshot!.documents {
                  document.reference.delete()
                    self.loadData()
                }
              }
            }
            
        }
        return cell
           
       }
    
    func validateFields() -> String? {
           
           let cat = cattxt.text!
           
           if cat == ""
           {
               return "Please Fill in All fields."
           }
        return nil
    }
    @IBAction func AddTaped(_ sender: Any) {
        
        let error = validateFields()
        let cat = cattxt.text!
        
    
        if error != nil
           {
               showError(error!)
           }
        else
           {
                self.errlbl.alpha = 0
              let db = Firestore.firestore()
             db.collection("Category").addDocument(data: ["name":cat])
        
    }
    loadData()
        cattxt.text=""
  
}
    func showError(_ message:String){
                
                errlbl.text=message
                errlbl.alpha=1
                
            }
}
