//
//  Person.swift
//  Project10_NamesToFaces
//
//  Created by Oğulcan Aşa on 14.06.2023.
//

import UIKit

class Person: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        aDecoder.encode(name, forKey: "name")
        aDecoder.encode(image, forKey: "image")
    }

    required init?(coder: NSCoder) {
        name = aDecoder.decodeObject( forKey: "name") as? String ?? ""
        image = aDecoder.decodeObject( forKey: "image") as? String ?? ""
    }

    var name: String
    var image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
