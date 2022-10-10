//
//  UserModel.swift
//  MVVMabsolutely
//
//  Created by Evgeniy Safin on 10.10.2022.
//

import Foundation

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    var name: String
//    var about: String {
//        return "about \(name)"
//    }
    var about: String?
}
