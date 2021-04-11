//
//  NewUserVIew.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import SwiftUI


struct NewUserView: View {
    
    @ObservedObject
    var viewModel: UserViewModel
    
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            Button("Add User") {
                let user = User(id: UUID().hashValue, name: name, username: username, email: email)
                viewModel.addUser(user: user)
                self.mode.wrappedValue.dismiss()
            }
        }
        .padding()
    }
    
}
