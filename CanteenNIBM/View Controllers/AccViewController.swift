

import UIKit
import Firebase

class AccViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var wow: UIView!
    @IBOutlet weak var datetxt: UITextField!
    @IBOutlet weak var tableView: UITableView!
       var catagory: [Acc] = []
        var cu = ""
        let datePicker = UIDatePicker()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            wow.addSubview(tableView)
            createDataPicker()
            loadData()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 80
            tableView.pin(to: wow)
            self.navigationItem.title = "Ac"
        }
        
        
        func loadData(){
                      
                      let db = Firestore.firestore()
                             db.collection("Orders").addSnapshotListener { (snap, err) in
                              self.catagory.removeAll()
                                 if err != nil{
                                     
                                     print((err?.localizedDescription)!)
                                     return
                                 }
                                 
                                 for i in snap!.documentChanges{
                                     
                                   
                                   let name = i.document.get("cus_name") as! String
                                   let price = i.document.get("price") as! String
                                   let date = i.document.get("time") as! String
                                
                                   
                                   self.catagory.append(Acc(name: name,price: price,date : date))
                                 }
                              
                              self.tableView.reloadData()
                              
                             }
                      
                      
                      
                  }
        
            func check()
            {
                
                    let db = Firestore.firestore()
                                           db.collection("Orders").addSnapshotListener { (snap, err) in
                                            self.catagory.removeAll()
                                               if err != nil{
                                                   
                                                   print((err?.localizedDescription)!)
                                                   return
                                               }
                                               
                                               for i in snap!.documentChanges{
                                                   
                                                 
                                                 let name = i.document.get("cus_name") as! String
                                                 let price = i.document.get("price") as! String
                                                 let date = i.document.get("time") as! String
                                                
                                                if date == self.cu {
                                                    
                                                     self.catagory.append(Acc(name: name,price: price,date : date))
                                                }
                                                 
                                                
                                               }
                                         
                                            self.tableView.reloadData()
                                            
                                           }
                
        }
        
        
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return catagory.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AccViewCell
                let Category = catagory[indexPath.row]
                cell.nametxt.text = Category.name
                cell.pricetxt.text = "Rs.\(Category.price)"
                cell.datetxt.text = Category.date
           
               return cell
            }
        
        
        
        
    func createDataPicker()
        {
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            
            let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            toolbar.setItems([donebtn], animated: true)
            
            datetxt.inputAccessoryView = toolbar
            datetxt.inputView = datePicker
            datePicker.datePickerMode = .date
        }
        
        @objc func donePressed(){
            
            let fom = DateFormatter()
            fom.dateStyle = .short
            fom.timeStyle = .none
            
            datetxt.text = fom.string(from: datePicker.date)
            self.view.endEditing(true)
            cu = datetxt.text!
            check()
        }
       


    }

    struct Acc {
        var name : String
        var price : String
        var date : String
    }

