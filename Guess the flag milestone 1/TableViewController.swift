//
//  TableViewController.swift
//  Guess the flag milestone 1
//
//  Created by Igor Polousov on 22.06.2021.
//

import UIKit

class TableViewController: UITableViewController {

    var pictures = [String]()
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flag viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png"){
                var newItems = item.replacingOccurrences(of: "@3x.png", with: "")
                newItems = newItems.capitalizingFirstLetter()
                if newItems.hasPrefix("U") {
                    newItems = newItems.uppercased()
                }
                names.append(newItems)
                pictures.append(item)
            }
        }
        print(names)
        print(pictures)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        cell.imageView?.image = UIImage(named: pictures[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailedViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
