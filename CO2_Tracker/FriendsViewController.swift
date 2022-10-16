//
//  FriendsViewController.swift
//  CO2_Tracker
//
//  Created by Anton Young on 10/14/22.
//

import UIKit

class FriendsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var friendsTableView: UITableView!
    let dataObject = Data()
    var userFriends:[String:Double] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Forestbg")!)
        friendsTableView.alpha = 0.65
        bottomView.layer.cornerRadius = 10
        userFriends = dataObject.friends
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
        friendsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "friendsCell")
        // Do any additional setup after loading the view.
    }
    func tableView(_ friendsTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = friendsTableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath)
        let sortedFriends = userFriends.sorted{ $0.1 < $1.1 }
        
        cell.textLabel?.text = " \(sortedFriends[indexPath.row].0) : \( sortedFriends[indexPath.row].1) kg"
        return cell
    }
    
    func tableView(_ friendsTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return userFriends.count

    }
    
    
    
    
    @IBAction func syncButtonPressed(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = true
        let syncVC = self.storyboard?.instantiateViewController(withIdentifier: "SyncViewController") as! SyncViewController
                self.navigationController?.pushViewController(syncVC, animated: false)
    }
    @IBAction func statsButtonPressed(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = true
        let statsVC = self.storyboard?.instantiateViewController(withIdentifier: "StatsViewController") as! StatsViewController
                self.navigationController?.pushViewController(statsVC, animated: false)
    }
    


}
