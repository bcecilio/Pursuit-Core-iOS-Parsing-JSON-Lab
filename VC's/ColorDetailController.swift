//
//  ColorDetailController.swift
//  Parsing-JSON-Lab
//
//  Created by Brendon Cecilio on 11/26/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class ColorDetailController: UIViewController {
    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    var detailColor: Colors?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let colors = detailColor else {
            fatalError("check segue")
        }
        redLabel.text = colors.rgb.r.description
        greenLabel.text = colors.rgb.g.description
        blueLabel.text = colors.rgb.b.description
    }
}
