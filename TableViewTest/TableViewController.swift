//
//  TableViewController.swift
//  TableViewTest
//
//  Created by Shashank Sharma on 10/17/18.
//  Copyright © 2018 Shashank Sharma. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
//    var names: [String] = ["Salman", "Vineeth", "Shashank"]
    var names: [String: [String]] = [
        "A": ["Andi", "Ayush"],
        "S": ["Salman", "Shashank", "Sujit"],
        "B": ["Ben", "Benjamin"]
    ]
    
    var sectionNames: [String] {
        return names.keys.sorted() // ["A","B","S"]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionNames.count // 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let currentSection = sectionNames[section] //"A"
        guard let currNames = names[currentSection] else { // ["Andi", "Ayush"]
            return 0
        }
        return currNames.count // 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section] // A B or S
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell") else {
            return UITableViewCell()
        }
        
        let currentSection = sectionNames[indexPath.section] //"A"
        guard let currNames = names[currentSection] else { // ["Andi", "Ayush"]
            return UITableViewCell()
        }
        cell.textLabel?.text = currNames[indexPath.row]
        return cell
    }

   

}
