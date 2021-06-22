//
//  DetailedViewController.swift
//  Guess the flag milestone 1
//
//  Created by Igor Polousov on 22.06.2021.
//

import UIKit

class DetailedViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        title = selectedImage?.capitalizingFirstLetter()
        title = title?.replacingOccurrences(of: "@3x.png", with: "")
        title = title?.replacingOccurrences(of: "Uk", with: "UK")
        title = title?.replacingOccurrences(of: "Us", with: "US")
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
}
