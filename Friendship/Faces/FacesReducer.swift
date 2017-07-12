//
//  FacesReducer.swift
//  Friendship
//
//  Created by Matthew Delves on 12/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import ReSwift

func facesReducer(action: FacesAction, state: State?) -> State {
    var newState = state ?? State()

    newState.faces = action.faces

    return newState
}
