//
//  ModelUser.swift
//  MyProjectOne
//
//  Created by Ivan Lyaskovets on 31.05.2022.
//

import Foundation
import UIKit

class ModelFriends{
    
    var users = [User]()
    
    func loadUsers(){
        let user1 = User(name: "Jack Minson", town: "Boston", image: UIImage(named: "male")!, gender: .male)
        let user2 = User(name: "Nicky Stevenson", town: "Chicago", image: UIImage(named: "female")!, gender: .female)
        let user3 = User(name: "Peter Svarovsky", town: "Berlin", image: UIImage(named: "male")!, gender: .male)
        let user4 = User(name: "Angelina Novikova", town: "Talin", image: UIImage(named: "female")!, gender: .female)
        let user5 = User(name: "Gerald Wilson", town: "Oslo", image: UIImage(named: "male")!, gender: .male)
        
        users.append(user1)
        users.append(user2)
        users.append(user3)
        users.append(user4)
        users.append(user5)
    }
    
    init(){
        loadUsers()
    }
    
}
