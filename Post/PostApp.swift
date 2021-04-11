//
//  PostApp.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import SwiftUI

@main
struct PostApp: App {
    var body: some Scene {
            WindowGroup {
                ContentView(viewModel: UserViewModel())
            }
    }
}
