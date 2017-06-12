//
//  ViewController.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/11/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "EarlyBird"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        results.removeAll()
    }

    func getResults(business: String, location: String) {
        var nameForInit,urlForInit: String!
        
        let path = "https://enigmatic-forest-54143.herokuapp.com/?business=\(business)&location=\(location)"
    
        Alamofire.request(path).responseJSON { response in
            
            if let json = response.result.value as? [String: Any] {
                if let data = json["data"] as? [Dictionary<String, Any>] {
                    
                    for i in 0..<data.count {
                        if let name = data[i]["name"] as? String {
                            nameForInit = name
                        }
                        
                        if let url = data[i]["url"] as? String {
                            urlForInit = url
                        }
                        
                        let result = Result.init(name: nameForInit, url: urlForInit)
                        self.results.append(result)
                    }
                    
                    self.performSegue(withIdentifier: "ShowResults", sender: self.results)
                }
            }
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        if searchTextField.text != "" && locationTextField.text != "" {
            getResults(business: searchTextField.text!, location: locationTextField.text!)
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
