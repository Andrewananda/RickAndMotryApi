//
//  MockURLSession.swift
//  RickAndMotryApiTests
//
//  Created by Andrew Ananda on 27/08/2024.
//

import Foundation


class MockURLSession: URLSession {
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = MockURLSessionDataTask()
        task.completionHandler = { [weak self] in
            completionHandler(self?.data, self?.urlResponse, self?.error)
        }
        return task
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    var completionHandler: (() -> Void)?
    
    override func resume() {
        completionHandler?()
    }
}
