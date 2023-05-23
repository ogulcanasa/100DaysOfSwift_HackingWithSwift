//
//  DetailViewController.swift
//  Project01_StormViewer
//
//  Created by Oğulcan Aşa on 22.05.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedPosition: Int?
    var numberOfImage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Picture \(selectedPosition!) of \(numberOfImage!)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
