//
//  RandomUserViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Brendon Cecilio on 11/25/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userLocation = [UsersDetail]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let RandomUserDetailController = segue.destination as? RandomUserDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        RandomUserDetailController.detailUser = userLocation[indexPath.row]
    }
    
    func loadData() {
        userLocation = UserData.getLocation()
    }
}

extension RandomUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userLocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let userCell = userLocation[indexPath.row]
        cell.textLabel?.text = userCell.name["first"] ?? ""
        cell.detailTextLabel?.text = userCell.location.country
        return cell
    }
    
    
}
