//
//  TagsReducer.swift
//  Friendship
//
//  Created by Matthew Delves on 10/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import ReSwift

func tagsReducer(action: TagsAction, state: State?) -> State {
    var newState = state ?? State()

    newState.tags = action.tags

    return newState
}
