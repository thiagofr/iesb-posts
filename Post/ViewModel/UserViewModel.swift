//
//  UserViewModel.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published
    private(set) var loading = false
    
    @Published
    private(set) var users = [User]() {
        didSet {
            loading = false
        }
    }
    
    private var usersCancellationToken: AnyCancellable?
    
    func fetchUsers() {
        usersCancellationToken?.cancel()
        
        if let url = URLService.getBaseURL("users") {
            let session = URLSession.shared

            let request = URLRequest(url: url)
            loading = true
            usersCancellationToken = session.dataTaskPublisher(for: request)
                .tryMap(session.map(_:))
                .decode(type: [User].self, decoder: JSONDecoder())
                .breakpointOnError()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: sinkError(_:)) { self.users = $0 }
        }
    }

    
    func addUser(user: User) {
        users.append(user)
    }
    
}
