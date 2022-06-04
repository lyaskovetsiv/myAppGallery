//
//  User.swift
//  MyProjectOne
//
//  Created by Ivan Lyaskovets on 31.05.2022.
//

import Foundation
import UIKit

class User{
    
    enum Gender{
        case male, female
    }
    
    var name: String
    var town: String
    var image: UIImage
    var gender: Gender
    
    init(name: String, town: String, image: UIImage, gender: Gender){
        self.name =  name
        self.town = town
        self.image = image
        self.gender = gender
    }
    
}
