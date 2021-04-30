//
//  AddItemViewController.swift
//  CanteenNIBM
//
//  Created by Ravindu Liyanage on 4/29/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class AddItemViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
   
    
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var desctxt: UITextField!
    @IBOutlet weak var pricetxt:UITextField!
    @IBOutlet weak var distxt: UITextField!
    @IBOutlet weak var errlbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var selecttxt: UITextField!
    let db = Firestore.firestore()
    var catagory: [String] = []
    var pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        pickerView.delegate = self
        pickerView.dataSource = self
        selecttxt.inputView = pickerView
        selecttxt.textAlignment = .center
        
    }
    
    func validateFields() -> String? {
        
        let name = nametxt.text!
        let desc = desctxt.text!
        let price = pricetxt.text!
        let dis = distxt.text!
        
        if name == "" || desc == "" || price == "" || dis == ""
        {
            return "Please Fill in All fields."
        }
        
        return nil
    }

    func showError(_ message:String){
        
        errlbl.text=message
        errlbl.alpha=1
        
    }
    
    func loadData(){

           
                  
                  db.collection("Category").addSnapshotListener { (snap, err) in
                      
                      if err != nil{
                          
                          print((err?.localizedDescription)!)
                          return
                      }
                      
                      for i in snap!.documentChanges{
                          
                          
                          let name = i.document.get("name") as! String
                          
                       
                       
                       self.catagory.append(name)
                      
                    
                     
                      }
                   print()
                   self.pickerView.reloadAllComponents()
                  }
           
           
           
       }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           catagory.count
       }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catagory[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selecttxt.text = catagory[row]
        selecttxt.resignFirstResponder()
        
    }
    
    @IBAction func upTap(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else{
            return
        }
        img.image = image


        Storage.storage().reference().child("images/file.png").putData(imageData, metadata: nil, completion: {_, error in
            guard error == nil else{
                print("Failed to upload")
                return
            }

            Storage.storage().reference().child("image/file.png").downloadURL(completion: {url, error in

                guard let url = url, error == nil else{
                    return
                }
                
                let urlString = url.absoluteString
                print(urlString)
                UserDefaults.standard.set(urlString, forKey: "url")
            })

        })
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func addTap(_ sender: Any) {
        let name = nametxt.text!
             let price = pricetxt.text!
        let cat = selecttxt.text!
        let error = validateFields()
        if error != nil
          {
              showError(error!)
          }
          else
          {
              self.errlbl.alpha = 0
                let db = Firestore.firestore()
                db.collection("categories").addDocument(data: ["category":cat,"name":name,"pic":"","price":price]){
                    (error)in

                    if error != nil{
                        self.showError("error saving data")
                    }
        }
        
    }
    
}
}
