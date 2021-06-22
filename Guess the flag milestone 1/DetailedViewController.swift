//
//  DetailedViewController.swift
//  Guess the flag milestone 1
//
//  Created by Igor Polousov on 22.06.2021.
//

import UIKit

class DetailedViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    
    var selctedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selctedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        title = selctedImage
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
}
