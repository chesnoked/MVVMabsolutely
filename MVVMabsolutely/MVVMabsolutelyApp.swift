//
//  MVVMabsolutelyApp.swift
//  MVVMabsolutely
//
//  Created by Evgeniy Safin on 10.10.2022.
//

import SwiftUI

@main
struct MVVMabsolutelyApp: App {
    
    @StateObject var userVM: UserViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            ChatMainView()
                .environmentObject(userVM)
        }
    }
}
