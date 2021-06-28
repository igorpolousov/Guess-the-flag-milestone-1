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

        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        title = selectedImage?.capitalizingFirstLetter()
        title = title?.replacingOccurrences(of: "@3x.png", with: " flag")
        title = title?.replacingOccurrences(of: "Uk", with: "UK flag")
        title = title?.replacingOccurrences(of: "Us", with: "US flag")
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlagPicture))
        
    }
    
    @objc func shareFlagPicture() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.7) else {
            print("No picture found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, "\(title!)"], applicationActivities: [])
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    
}
