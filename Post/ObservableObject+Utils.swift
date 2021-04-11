//
//  ObservableObject+Utils.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import Foundation
import Combine

extension ObservableObject {
    
    internal func sinkError(_ completion: Subscribers.Completion<Error>) {
        switch completion {
            case .failure(let error): debugPrint(error)
            default: break
        }
    }
    
}
