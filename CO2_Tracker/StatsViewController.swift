//
//  StatsViewController.swift
//  CO2_Tracker
//
//  Created by Anton Young on 10/14/22.
//

import UIKit

class StatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var timeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var statisticsChart: UIView!
    @IBOutlet weak var totalEmissionsLabel: UILabel!
    @IBOutlet weak var treeEquivalentText: UILabel!
    @IBOutlet weak var maxEmissionsLabel: UILabel!
    @IBOutlet weak var statisticsTableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    //This will be replaced by userDefault calls -----
    var filteredData_day =  ["Green: 2266.0m", "Bus: 0.0m", "Car: 8293m", "Subway: 0.0m"]
    var filteredData_week =  ["Green: 1633m", "Bus: 0.0m", "Car: 186237m", "Subway: 0.0m"]
    var filteredData_month =  ["Green: 25992.81m", "Bus: 3476.0m", "Car: 262196.0m", "Subway: 0.0m"]
    var filteredData_year =  ["Green: 46127.21m", "Bus: 10768.0m", "Car: 475821.0m", "Subway: 0.0m"]
    // -----------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Forestbg")!)
        statisticsChart.backgroundColor = UIColor(patternImage: UIImage(named: "day")!)
        feedbackLabel.text = "Well Done! You used less C02 than the average american this day"
        statisticsTableView.alpha = 0.65
        bottomView.layer.cornerRadius = 10
        statisticsChart.layer.cornerRadius = 10
        statisticsTableView.dataSource = self
        statisticsTableView.delegate = self
        statisticsTableView.delegate = self
        totalEmissionsLabel.text = "Total emissions:  \(String(UserDefaults.standard.double(forKey:"daytotal")))"
        treeEquivalentText.text = "Min C02: \(UserDefaults.standard.double(forKey: "minemissions")) kg"
        statisticsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "statCell")
    }
    
    //##################### time selector ##########################
    @IBAction func timeSegControlChanged(_ sender:UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            //Calculate today's emissions and update Userdefaults
            print("Showing today's emissions")
            statisticsChart.backgroundColor = UIColor(patternImage: UIImage(named: "day")!)
            let userEmission = round(UserDefaults.standard.double(forKey:"daytotal") * 100) / 100
            let treesEqu = round((userEmission / 0.068) * 100) / 100
            treeEquivalentText.text = "Number of trees equivalent: \(treesEqu)"
            totalEmissionsLabel.text = "Total emissions:  \(String(userEmission)) kg"
            if userEmission < 28.56 {
                feedbackLabel.text = "Well Done! You used less C02 than the average american this day"
            }
            else {
                feedbackLabel.text = "You used more C02 than the average american this day"
            }
            
        case 1:
            //Calculate this week's emissions and update Userdefaults
            print("Showing this week's emissions")
            statisticsChart.backgroundColor = UIColor(patternImage: UIImage(named: "week")!)
            let userEmission = round(UserDefaults.standard.double(forKey:"weektotal") * 100) / 100
            let treesEqu = round((userEmission / 0.48) * 100) / 100
            treeEquivalentText.text = "Number of trees equivalent: \(treesEqu)"
            totalEmissionsLabel.text = "Total emissions:  \(String(round(UserDefaults.standard.double(forKey:"weektotal") * 100) / 100)) kg"
            if userEmission < 200.5 {
                feedbackLabel.text = "Well Done! You used less C02 than the average american this week"
            }
            else {
                feedbackLabel.text = "You used more C02 than the average american this week"
            }
        case 2:
            //Calculate this month's emissions and update Userdefaults
            print("Showing this month's emissions")
            statisticsChart.backgroundColor = UIColor(patternImage: UIImage(named: "month")!)
            let userEmission = round(UserDefaults.standard.double(forKey:"monthtotal") * 100) / 100
            let treesEqu = round((userEmission / 2.08) * 100) / 100
            treeEquivalentText.text = "Number of trees equivalent: \(treesEqu)"
            totalEmissionsLabel.text = "Total emissions:  \(String(round(UserDefaults.standard.double(forKey:"monthtotal") * 100) / 100)) kg"
            if userEmission < 868.7 {
                feedbackLabel.text = "Well Done! You used less C02 than the average american this month"
            }
            else {
                feedbackLabel.text = "You used more C02 than the average american this month"
            }
        case 3:
            //Calculate this year's emissions and update Userdefaults
            print("Showing this year's emissions")
            statisticsChart.backgroundColor = UIColor(patternImage: UIImage(named: "year")!)
            let userEmission = round(UserDefaults.standard.double(forKey:"yeartotal") * 100) / 100
            let treesEqu = round((userEmission / 25) * 100) / 100
            treeEquivalentText.text = "Number of trees equivalent: \(treesEqu)"
            totalEmissionsLabel.text = "Total emissions:  \(String(round(UserDefaults.standard.double(forKey:"yeartotal") * 100) / 100)) kg"
            if userEmission < 10424 {
                feedbackLabel.text = "Well Done! You used less C02 than the average american this year"
            }
            else {
                feedbackLabel.text = "You used more C02 than the average american this year"
            }
        default:
            print("Error")
        }
        statisticsTableView.reloadData()
        
    }
    //################### Statistics Table View ####################
    func tableView(_ statisticsTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = statisticsTableView.dequeueReusableCell(withIdentifier: "statCell", for: indexPath)
        switch timeSegmentedControl.selectedSegmentIndex {
        case 0:
            //Calculate today's emissions and update Userdefaults
            cell.textLabel?.text = filteredData_day[indexPath.row]
        case 1:
            //Calculate this week's emissions and update Userdefaults
            cell.textLabel?.text = filteredData_week[indexPath.row]
        case 2:
            //Calculate this month's emissions and update Userdefaults
            cell.textLabel?.text = filteredData_month[indexPath.row]
        case 3:
            //Calculate this year's emissions and update Userdefaults
            cell.textLabel?.text = filteredData_year[indexPath.row]
        default:
            cell.textLabel?.text = filteredData_day[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ statisticsTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch timeSegmentedControl.selectedSegmentIndex {
        case 0:
            //Calculate today's emissions and update Userdefaults
            return filteredData_day.count
        case 1:
            //Calculate this week's emissions and update Userdefaults
            return filteredData_week.count
        case 2:
            //Calculate this month's emissions and update Userdefaults
            return filteredData_month.count
        case 3:
            //Calculate this year's emissions and update Userdefaults
            return filteredData_year.count
        default:
            return filteredData_day.count
    }
    }
    //###############################################################
    //Navigation buttons
    @IBAction func syncButtonPressed(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = true
        let syncVC = self.storyboard?.instantiateViewController(withIdentifier: "SyncViewController") as! SyncViewController
                self.navigationController?.pushViewController(syncVC, animated: false)
    }
    @IBAction func friendsButtonPressed(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = true
        let friendsVC = self.storyboard?.instantiateViewController(withIdentifier: "FriendsViewController") as! FriendsViewController
                self.navigationController?.pushViewController(friendsVC, animated: false)
    }
    //###############################################################



}
