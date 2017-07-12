//
//  Face.swift
//  Friendship
//
//  Created by Matthew Delves on 12/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import Foundation

struct Face: Codable {
    let id: String
    let views: String
    let enabled: String
    let link: String
    let image: String
    let thumbnail: String
    let category: Category
    let tags: [String]
}

struct Category: Codable {
    let id: String
    let name: String
}
