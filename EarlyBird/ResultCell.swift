//
//  ResultCell.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/12/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    func configureCell(result: Result) {
        nameLabel.text = result.resultName
        urlLabel.text = result.resultUrl
    }
}
