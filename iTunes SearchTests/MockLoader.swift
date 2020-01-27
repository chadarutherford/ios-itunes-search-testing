//
//  MockLoader.swift
//  iTunes SearchTests
//
//  Created by Chad Rutherford on 1/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
@testable import iTunes_Search

class MockLoader: NetworkDataLoader {
    
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    func loadData(using request: URLRequest, completion: @escaping (Data?, HTTPURLResponse?, Error?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.data, self.response, self.error)
        }
    }
}
