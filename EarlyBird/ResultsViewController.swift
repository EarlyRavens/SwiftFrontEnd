//
//  ResultsViewController.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/12/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var resultsTableView: UITableView!
    
    var results = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Results"
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = results[indexPath.row]
        
        return cell!
    }
}
