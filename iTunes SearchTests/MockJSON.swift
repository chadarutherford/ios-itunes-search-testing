//
//  MockJSON.swift
//  iTunes SearchTests
//
//  Created by Chad Rutherford on 1/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

let goodResultData = """
{
    "resultCount": 2,
    "results": [
        {
            "trackName": "GarageBand",
            "artistName": "Apple"
        },
        {
            "trackName": "Shortcut: GarageBand Edition",
            "artistName": "Mark Keroles"
        }
    ]
}
""".data(using: .utf8)!

let badResultData = """
{
    "resultCount": 2,
    "results": [
        {
            "trackName": "GarageBand",
            "artistName": "Apple
        },
        {
            "trackName": "Shortcut: GarageBand Edition",
            "artistName": "Mark Keroles"
        }
    ]
""".data(using: .utf8)!

let noResultsData = """
{
    "resultCount": 0,
    "results": []
}
""".data(using: .utf8)!
