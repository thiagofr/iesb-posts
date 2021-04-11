//
//  PostViewModel.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    
    @Published
    private(set) var loading = false
    
    @Published
    private(set) var posts = [Post]() {
        didSet {
            loading = false
        }
    }

    private var postCancellationToken: AnyCancellable?
    
    func getPosts(user: User) {
        postCancellationToken?.cancel()
            
        if let url = URLService.getBaseURL("users/\(user.id)/posts") {
            let session = URLSession.shared

            let request = URLRequest(url: url)
            loading = true
            postCancellationToken = session.dataTaskPublisher(for: request)
                .tryMap(session.map(_:))
                .decode(type: [Post].self, decoder: JSONDecoder())
                .breakpointOnError()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: sinkError(_:)) { self.posts = $0 }
        }
    }
    
}
