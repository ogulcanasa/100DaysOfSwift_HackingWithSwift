//
//  ViewController.swift
//  Project01_StormViewer
//
//  Created by Oğulcan Aşa on 21.05.2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var numberOfShow = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load
                pictures.append(item)
            }
        }
        pictures.sort() // shows the image names in sorted order in table view

        for _ in 0..<pictures.count {
            numberOfShow.append(0)
        }

        let defaults = UserDefaults.standard

        if let savedPeople = defaults.object(forKey: "people") as? Data {
            let jsonDecoder = JSONDecoder()

            do {
                numberOfShow = try jsonDecoder.decode([Int].self, from: savedPeople)
            } catch {
                print("Failed to load people")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.numberOfImage = pictures.count
            vc.selectedPosition = (indexPath.row + 1)
            numberOfShow[indexPath.row] += 1
            vc.selectedNumberOfShow = numberOfShow
            save()
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func save() {
        let jsonEncoder = JSONEncoder()

        if let savedData = try? jsonEncoder.encode(numberOfShow) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        } else {
            print("failed to save people")
        }
    }
}

