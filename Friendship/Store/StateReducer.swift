//
//  StateReducer.swift
//  Friendship
//
//  Created by Matthew Delves on 10/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import ReSwift
import ReSwiftRouter

func stateReducer(action: Action, state: State?) -> State {
    var newState = state ?? State()

    if let tagsAction = action as? TagsAction {
        newState = tagsReducer(action: tagsAction, state: newState)
    }

    if let facesAction = action as? FacesAction {
        newState = facesReducer(action: facesAction, state: state)
    }

    if let navAction = action as? SetRouteAction {
        newState.navigationState = NavigationReducer.handleAction(navAction, state: newState.navigationState)
    }

    if let navDataAction = action as? SetRouteSpecificData {
        newState.navigationState = NavigationReducer.handleAction(navDataAction, state: newState.navigationState)
    }

    return newState
}
