//
//  SyncViewController.swift
//  CO2_Tracker
//
//  Created by Anton Young on 10/14/22.
//

import UIKit

class SyncViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var friendsButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var drivingLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    var dataObject = Data()
    var data:[String:Double] = [:]
    var filteredData:[String:Double] = [:]
    var tableShow:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Forestbg")!)
        logoView.image = UIImage(named: "walkingTreesLogo")
        logoView.alpha = 0.9
        bottomView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        data = dataObject.cars
        filteredData = data
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        tableView.alpha = 0.0
        drivingLabel.text = "Driving: \( UserDefaults.standard.string(forKey: "Car") ?? "Not set")"
        print(UserDefaults.standard.double(forKey: "Mileage"))
        //This will be deleted when data is added ------------------
        UserDefaults.standard.set(10, forKey:"totalemissions")
        UserDefaults.standard.set(2, forKey:"minemissions")
        UserDefaults.standard.set(4.5, forKey:"maxemissions")
        //--------------------------------------------------------
    }
    //########Grabs data from csv into array
    //####################### Change car ##############################
    @IBAction func syncButton(_ sender: Any) {
        dataObject.calculateEmissions()
    }
    @IBAction func changeCarButton(_ sender: Any) {
        if (tableShow == false) {
            tableView.alpha = 0.65
            tableShow = true
        } else {
            tableView.alpha = 0.0
            tableShow = false
        }
    }
 //####################### Car search table #########################
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = Array(filteredData.keys)[indexPath.row]
            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = Array(filteredData.keys)[indexPath.row]
        let mileage = Array(filteredData.values)[indexPath.row]
        UserDefaults.standard.set(car, forKey:"Car")
        UserDefaults.standard.set(mileage, forKey:"Mileage")
        tableView.alpha = 0.0
        tableShow = false
        drivingLabel.text = "Driving: \(UserDefaults.standard.string(forKey: "Car") ?? "Not set")"
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
        }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            filteredData = searchText.isEmpty ? data : data.filter { (key, value) -> Bool in
                return key.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            tableView.reloadData()
        }
    //##############################################################
    //Navigation buttons
    @IBAction func statsButtonPressed(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = true
        let statsVC = self.storyboard?.instantiateViewController(withIdentifier: "StatsViewController") as! StatsViewController
                self.navigationController?.pushViewController(statsVC, animated: false)
    }
    @IBAction func friendsButtonPressed(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = true
        let friendsVC = self.storyboard?.instantiateViewController(withIdentifier: "FriendsViewController") as! FriendsViewController
                self.navigationController?.pushViewController(friendsVC, animated: false)
    }
//##################################################################
}
