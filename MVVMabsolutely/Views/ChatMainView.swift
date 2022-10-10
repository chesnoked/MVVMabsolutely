//
//  ContentView.swift
//  MVVMabsolutely
//
//  Created by Evgeniy Safin on 10.10.2022.
//

import SwiftUI

struct ChatMainView: View {
//    @StateObject var userVM: UserViewModel = UserViewModel()
    @EnvironmentObject var userVM: UserViewModel
    @State var selectedUser: UserModel? = nil
    @State var showUserInfo: Bool = false
    var body: some View {
        ZStack {
            
            // user personal
            userPersonal
            
            // users
            usersList
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}

extension ChatMainView {
    // user personal
    @ViewBuilder private var userPersonal: some View {
        if showUserInfo {
            UserPersonalView(user: $selectedUser, showUserInfo: $showUserInfo)
                .zIndex(2)
                .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                .animation(.linear(duration: 1))
        }
    }
    // users list
    private var usersList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(userVM.users) { user in
                    HStack(spacing: 15) {
                        Text(user.name)
                            .font(.headline)
                            .bold()
                            .padding()
                            .foregroundColor(Color.pink)
                            .background(Color.white.cornerRadius(5))
                        Text(user.about ?? "about \(user.name)")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .onTapGesture {
                        selectedUser = user
                        self.showUserInfo.toggle()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMainView()
    }
}
