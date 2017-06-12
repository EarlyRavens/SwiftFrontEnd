//
//  ViewController.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/11/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "EarlyBird"
    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        if searchTextField.text != "" && locationTextField.text != "" {
            let search = searchTextField.text!
            let location = locationTextField.text!
            
            let results = [search, location]
            
            performSegue(withIdentifier: "ShowResults", sender: results)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResults" {
            if let resultsVC = segue.destination as? ResultsViewController {
                if let results = sender as? [String] {
                    resultsVC.results = results
                }
            }
        }
    }
}
