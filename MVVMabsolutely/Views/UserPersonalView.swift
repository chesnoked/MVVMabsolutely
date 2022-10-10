//
//  UserPersonalView.swift
//  MVVMabsolutely
//
//  Created by Evgeniy Safin on 10.10.2022.
//

import SwiftUI

struct UserPersonalView: View {
//    @ObservedObject var userVM: UserViewModel
    @EnvironmentObject var userVM: UserViewModel
    @Binding var user: UserModel?
    @Binding var showUserInfo: Bool
    @State private var userAboutText: String = ""
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Text(user?.about ?? "no user")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                TextField("about", text: $userAboutText)
                    .foregroundColor(Color.gray)
                    .padding()
                    .background(Color.black.cornerRadius(5))
                    .padding(.horizontal)
                Button(action: {
//                    user?.about = userAboutText
                    // разворачиваем опционального юзера
                    if let user = user {
                        // определяем индекс нахождения этого юзера в массиве users (по id)
                        guard let userIndex = userVM.users.firstIndex(where: { oneUser in
                            user.id == oneUser.id
                        }) else { return }
                        // изменяем у этого юзера в массиве users свойство about
                        userVM.users[userIndex].about = userAboutText
                        // binding user'a меняем на нового юзера из массива. Вместо строчки (user?.about = userAboutText)
                        self.user = userVM.users[userIndex]
                    }
                }, label: {
                    Text("Set user")
                        .font(.title2)
                        .bold()
                })
            }
            // close button
            closeButton
                .padding(.bottom)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
    
    // MARK: Close button
    private var closeButton: some View {
        VStack(spacing: 0) {
            Spacer()
            Button(action: {
                self.showUserInfo.toggle()
            }, label: {
                Text("Close")
            })
        }
    }
}

struct UserPersonalView_Previews: PreviewProvider {
    static var previews: some View {
        UserPersonalView(user: .constant(UserModel(name: "username", about: "about user")), showUserInfo: .constant(false))
    }
}
