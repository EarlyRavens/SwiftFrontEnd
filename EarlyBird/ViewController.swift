//
//  ViewController.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/11/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "EarlyBird"
    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        if searchTextField.text != "" && locationTextField.text != "" {
            let search = searchTextField.text!
            let location = locationTextField.text!
            
            print(search)
            print(location)
        }
    }
}
