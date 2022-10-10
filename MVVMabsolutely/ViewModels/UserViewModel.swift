//
//  UserViewModel.swift
//  MVVMabsolutely
//
//  Created by Evgeniy Safin on 10.10.2022.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var users: [UserModel] = []
    
    init() {
        self.getUsers()
    }
    
    func addUser(user: UserModel) {
        self.users.append(user)
    }
    
    func getUsers() {
        let user1 = UserModel(name: "User1", about: "about user1")
        let user2 = UserModel(name: "User2", about: "about user2")
        let user3 = UserModel(name: "User3", about: "about user3")
        let user4 = UserModel(name: "User4", about: "about user4")
        let user5 = UserModel(name: "User5", about: "about user5")
        
        self.users.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5
        ])
    }
}
