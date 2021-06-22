//
//  TableViewController.swift
//  Guess the flag milestone 1
//
//  Created by Igor Polousov on 22.06.2021.
//

import UIKit

class TableViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png"){
                pictures.append(item)
            }
        }
        print(pictures)
       
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

}
