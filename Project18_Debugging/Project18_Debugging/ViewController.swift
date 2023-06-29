//
//  ViewController.swift
//  Project18_Debugging
//
//  Created by Oğulcan Aşa on 29.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("I'm inside the viewDidLoad() method")

        print(1,2,3,4,5, separator: "-")
        print("Some message", terminator: ".")

        assert(myReallySlowMethod() == true, "The slow method returned false, which is a bad thing!")
        assert(1 == 1, "No Problem")
        // assert(1 == 2, "Math Problem")

        for i in 1 ... 100 {
            // write "p i" to take value of i
            print("Got number \(i)")
        }
    }

    func myReallySlowMethod() -> Bool {
        return true
    }

}

