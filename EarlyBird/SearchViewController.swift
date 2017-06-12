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
        
        self.title = "EarlyBird"
    }

    func getResults(business: String, location: String) {
        let path = "https://enigmatic-forest-54143.herokuapp.com/?business=\(business)&location=\(location)"
        let url = URL(string: path)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        _ = session.dataTask(with: request) { (data, response, error) -> Void in
            print(data ?? "no data")
            print(response ?? "no response")
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        if searchTextField.text != "" && locationTextField.text != "" {
            let result = Result.init(name: "Sushi", url: "94105")
            let results = [result]
            
            getResults(business: result.resultName, location: result.resultUrl)
            
            performSegue(withIdentifier: "ShowResults", sender: results)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResults" {
            if let resultsVC = segue.destination as? ResultsViewController {
                if let results = sender as? [Result] {
                    resultsVC.results = results
                }
            }
        }
    }
}
