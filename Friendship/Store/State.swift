//
//  State.swift
//  Friendship
//
//  Created by Matthew Delves on 10/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import ReSwift
import ReSwiftRouter

struct State: StateType {
    var tags: [String] = []
    var navigationState: NavigationState = NavigationState()
}
