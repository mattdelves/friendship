//
//  FacesViewModel.swift
//  Friendship
//
//  Created by Matthew Delves on 12/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import ReSwift
import ReSwiftRouter
import BrightFutures

class FacesViewModel {
    weak var store: Store<State>?
    let session: URLSession
    let api: TagsAPI
    let tag: String

    init(store: Store<State>, tag: String) {
        self.store = store
        self.session = URLSession.shared
        self.api = TagsAPI(endpoint: "http://ponyfac.es/api.json/tag", session: session)
        self.tag = tag
    }

    func fetch() {
        api.fetch(tag: tag).onSuccess { [weak self] faces in
            // Dispatch the action
            let action = FacesAction(faces: faces)
            self?.store?.dispatch(action)
        }
    }

    func popRoute() {
        guard let store = store else { return }

        var route = store.state.navigationState.route
        _ = route.removeLast()

        let action = SetRouteAction(route)
        store.dispatch(action)
    }
}
