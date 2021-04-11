//
//  PostsView.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import SwiftUI

struct PostsView: View {
    
    var user: User
    
    @EnvironmentObject
    private var viewModel: PostViewModel
    
    var body: some View {
        Group {
            List {
                ForEach(viewModel.posts) { post in
                    Text(post.title)
                }
            }
        }.onAppear {
            viewModel.getPosts(user: user)
        }
    }
    
}
