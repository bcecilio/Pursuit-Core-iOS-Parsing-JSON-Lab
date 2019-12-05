//
//  WeatherViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Brendon Cecilio on 11/25/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var weather = [Weather]() {
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let WeatherDetailController = segue.destination as? WeatherDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        WeatherDetailController.detailWeather = weather[indexPath.row]
    }
    
    func loadData() {
        weather = WeatherData.getWeather()
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        let weatherCell = weather[indexPath.row]
        cell.textLabel?.text = weatherCell.name
        return cell
    }
    
    
}
