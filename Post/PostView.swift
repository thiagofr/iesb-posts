//
//  PostView.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import SwiftUI

struct PostView: View {
    
    @EnvironmentObject
    var viewModel: PostViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
