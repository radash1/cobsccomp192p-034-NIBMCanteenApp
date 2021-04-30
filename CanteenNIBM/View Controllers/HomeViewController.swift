
import UIKit
import Firebase
import CoreLocation
class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {
    
    @IBOutlet weak var wow: UIView!
    var fried: [New] = []
    var nod: [New] = []
    var bur: [New] = []
    var drk: [New] = []
    var kot: [New] = []
    private var locationManager:CLLocationManager?
    @IBOutlet weak var tableView: UITableView!
    //    private let tableView: UITableView = {
//        
//        let table = UITableView()
//        table.register(TableViewCell.self, forCellReuseIdentifier: "cafe")
//        return table
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        locationManager = CLLocationManager()
//        locationManager?.requestAlwaysAuthorization()
//        locationManager?.startUpdatingLocation()
//        locationManager?.delegate = self
        loadData()
        wow.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cafe")
        tableView.rowHeight = 200
        tableView.pin(to: wow)
        self.navigationItem.title = "HOME"
        
    }
    
    func loadData(){

        let db = Firestore.firestore()
               
               db.collection("categories").addSnapshotListener { (snap, err) in
                   
                   if err != nil{
                       
                       print((err?.localizedDescription)!)
                       return
                   }
                   
                   for i in snap!.documentChanges{
                       
                      
                       let name = i.document.get("name") as! String
                       let price = i.document.get("price") as! String
                       let pic = i.document.get("pic") as! String
                       let cat = i.document.get("category") as! String
                    
                    if cat == "friedrice"
                    {
                         self.fried.append(New( name: name, price: price, pic: pic))
                    }
                    if cat == "buriyani"
                    {
                         self.bur.append(New( name: name, price: price, pic: pic))
                    }
                    if cat == "kottu"
                    {
                         self.kot.append(New( name: name, price: price, pic: pic))
                    }
                    if cat == "noodles"
                    {
                         self.nod.append(New( name: name, price: price, pic: pic))
                    }
                    if cat == "drinks"
                    {
                         self.drk.append(New( name: name, price: price, pic: pic))
                    }
                    
                   
                   
                 
                   }
                print()
                self.tableView.reloadData()
               }
        
        
        
    }
   
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let label2 = UILabel()
        let label3 = UILabel()
        let label4 = UILabel()
         let label5 = UILabel()
        label.text = "FriedRice"
        label2.text = "Buriyani"
        label3.text = "Kottu"
        label4.text = "Noodles"
          label5.text = "Drinks"
        label.backgroundColor = UIColor.lightGray
         label2.backgroundColor = UIColor.lightGray
        label3.backgroundColor = UIColor.lightGray
        label4.backgroundColor = UIColor.lightGray
         label5.backgroundColor = UIColor.lightGray
        if section == 0{
                       return label
                   }
        if section == 1{
            return label2
        }
        if section == 2{
            return label3
        }
        if section == 3{
            return label4
        }
                  return label5
       
    }
        
     func numberOfSections(in tableView: UITableView) -> Int {
           return 5
       }
       
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               if section == 0{
                return fried.count
            }
                if section == 1{
                    
                     return bur.count
                }
            if section == 2{
                    
                 return kot.count
                }
            if section == 3{
                    
                 return nod.count
                }
            return drk.count
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! itemViewCell
        
        let Category = indexPath.section == 0 ? fried[indexPath.row] :indexPath.section == 1 ? bur[indexPath.row] :indexPath.section == 2 ? kot[indexPath.row] :indexPath.section == 3 ? nod[indexPath.row] : drk[indexPath.row]
        
        cell.nametxt.text = Category.name
        cell.pricetxt.text = "Rs.\(Category.price)"

        let url = URL(string: Category.pic)
        let getDataTask = URLSession.shared.dataTask(with: url!){ data, _, error in
            
            guard let data = data, error == nil else{
                    return
                }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                cell.imgview.image = image
            
            }
        }
        getDataTask.resume()
        
        
        
        
        return cell
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            print(location.coordinate.latitude)
//            print((location.coordinate.longitude))
//        }
//    }

    
    
}

extension UIView {
    
    func pin(to wow: UIView){
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: wow.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: wow.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: wow.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: wow.bottomAnchor).isActive = true
        
    }
    
}


struct New {
    var name : String
    var price : String
    var pic : String
}
