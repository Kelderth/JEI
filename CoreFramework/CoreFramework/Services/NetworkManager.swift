//
//  NetworkManager.swift
//  CoreFramework
//
//  Created by Jesus Sanchez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import Foundation

public class NetworkManager {
    // MARK: Properties
    public enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    public static func performRequest(for url: URL,
                               httpMethod: HTTPMethod,
                               urlParameters: [String : String]? = nil,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil) {
        
        // Build our entire URL
        let requestURL = self.url(byAdding: urlParameters, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        // Create and "resume" (a.k.a. run) the task
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            completion?(data, error)
        }
        dataTask.resume()
    }
    
    public static func url(byAdding parameters: [String : String]?, to url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters?.compactMap({ URLQueryItem(name: $0.0, value: $0.1) })
        
        guard let url = components?.url else {
            fatalError("URL optional is nil")
        }
        return url
    }
}
