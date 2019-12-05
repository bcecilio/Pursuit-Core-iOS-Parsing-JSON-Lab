//
//  ViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Brendon Cecilio on 11/25/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var colorVC = [Colors]() {
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ColorDetailController = segue.destination as? ColorDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        ColorDetailController.detailColor = colorVC[indexPath.row]
    }
    
    func loadData() {
        colorVC = ColorData.getColors()
    }

}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorVC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let colorCell = colorVC[indexPath.row]
        cell.textLabel?.text = colorCell.name.value
        cell.backgroundColor = UIColor(red: CGFloat(colorCell.rgb.r/255), green: CGFloat(colorCell.rgb.g/255), blue: CGFloat(colorCell.rgb.b/255), alpha: 1.0)
        
        return cell
    }
    
    
}

