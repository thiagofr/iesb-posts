//
//  URLService.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import Foundation

class URLService {
    
    private static let kBaseURL = "https://jsonplaceholder.typicode.com/"
    
    static func getBaseURL(_ endpoint: String) -> URL? {
        if let url = URL(string: kBaseURL.appending(endpoint)) {
            return url
        }
        return nil
    }
    
}
