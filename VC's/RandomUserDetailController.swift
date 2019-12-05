//
//  RandomUserDetailController.swift
//  Parsing-JSON-Lab
//
//  Created by Brendon Cecilio on 11/27/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class RandomUserDetailController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImage!
    @IBOutlet weak var userCountryLabel: UILabel!
    @IBOutlet weak var userCityLabel: UILabel!
    @IBOutlet weak var userStateLabel: UILabel!
    @IBOutlet weak var userStreetLabel: UILabel!
    
    var detailUser: UsersDetail?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let user = detailUser else {
            fatalError("check segue")
        }
        userCountryLabel.text = user.location.country
        userCityLabel.text = user.location.country
        userStateLabel.text = user.location.state
        userStreetLabel.text = user.location.street.number.description
    }
}
