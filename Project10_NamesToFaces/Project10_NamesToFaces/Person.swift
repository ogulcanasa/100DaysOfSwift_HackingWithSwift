//
//  Person.swift
//  Project10_NamesToFaces
//
//  Created by Oğulcan Aşa on 14.06.2023.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
