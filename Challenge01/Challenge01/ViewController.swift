//
//  ViewController.swift
//  Challenge01
//
//  Created by Oğulcan Aşa on 27.05.2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var choosenCountry : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("flag") {
                // this is a picture to load
                pictures.append(item)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.textAlignment = .center
        if let countryName = pictures[indexPath.row].range(of: ".") {
            let countryCode = String(pictures[indexPath.row][countryName.upperBound...])
            choosenCountry = countryCode.uppercased()
            cell.textLabel?.text = choosenCountry
        }
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.borderWidth = 0.25
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        if let image = UIImage(named: "\(pictures[indexPath.row])") {
                // The size of the imageView.image
                let desiredImageSize = CGSize(width: 64, height: 36)
                // Resize the image
                UIGraphicsBeginImageContextWithOptions(desiredImageSize, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: desiredImageSize))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()

                cell.imageView?.image = scaledImage
            }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

