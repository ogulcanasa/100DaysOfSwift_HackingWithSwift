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

        let recommendButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(recommendApp))
        let shareImage = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        navigationItem.rightBarButtonItems = [recommendButton, shareImage]

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

    @objc func shareTapped() {
            guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
                print("No image found")
                return
            }

        let vc = UIActivityViewController(activityItems: [image, selectedImage ?? "image"], applicationActivities: [])
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true)
        }

    @objc func recommendApp() {
        let shareLink = "https://github.com/ogulcanasa/100DaysOfSwift_HackingWithSwift/tree/main/Project01_StormViewer"
        let vc = UIActivityViewController(activityItems: [shareLink], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
