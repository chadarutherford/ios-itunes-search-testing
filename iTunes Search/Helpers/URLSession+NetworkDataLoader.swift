//
//  URLSession+NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Chad Rutherford on 1/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension URLSession: NetworkDataLoader {
    func loadData(using request: URLRequest, completion: @escaping (Data?, HTTPURLResponse?, Error?) -> ()) {
        dataTask(with: request) { data, response, error in
            completion(data, response as? HTTPURLResponse, error)
        }.resume()
    }
}
