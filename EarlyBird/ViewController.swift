//
//  ViewController.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/11/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var names = ["Max", "Mina", "Patrick", "Earl"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        if searchTextField.text != "" && locationTextField.text != "" {
            let search = searchTextField.text!
            let location = locationTextField.text!
            
            print(search)
            print(location)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        cell!.textLabel!.text = names[indexPath.row]
        
        return cell!
    }
}

