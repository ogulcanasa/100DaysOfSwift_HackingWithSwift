//
//  ViewController.swift
//  Project12_UserDefaults
//
//  Created by Oğulcan Aşa on 18.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard

        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseTouchID")
        defaults.set(CGFloat.pi, forKey: "Pi")

        defaults.set("Paul Hudson", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")

        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")

        let dict = ["Name": "Paul", "Country": "UK"]
        defaults.set(dict, forKey: "SavedDict")

        let array2 = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
        let dict2 = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()
    }
}

/*
 integer(forKey:) returns an integer if the key existed, or 0 if not.
 bool(forKey:) returns a boolean if the key existed, or false if not.
 float(forKey:) returns a float if the key existed, or 0.0 if not.
 double(forKey:) returns a double if the key existed, or 0.0 if not.
 object(forKey:) returns Any? so you need to conditionally typecast it to your data type.
 */
