//
//  TagsResponse.swift
//  Friendship
//
//  Created by Matthew Delves on 12/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import Foundation

struct TagsResponse: Codable {
    var timestamp: Double
    var totalFaces: String
    var totalViews: String
    var faces: [Face]

    enum CodingKeys: String, CodingKey {
        case timestamp
        case totalFaces = "total_faces"
        case totalViews = "total_views"
        case faces
    }
}
