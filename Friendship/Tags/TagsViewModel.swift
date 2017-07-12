//
//  TagsViewModel.swift
//  Friendship
//
//  Created by Matthew Delves on 10/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import ReSwift
import ReSwiftRouter

final class TagsViewModel {
    weak var store: Store<State>?
    let session: URLSession
    let service: TagsAPI

    init(store: Store<State>?) {
        self.store = store
        session = URLSession.shared
        service = TagsAPI(endpoint: "http://ponyfac.es/api.json/tags", session: session)
    }

    func fetch() {
        service.fetch().onSuccess { [weak self] tags in
            let action = TagsAction(tags: tags)
            self?.store?.dispatch(action)
        }
    }

    func display(tag: String) {
        guard let store = store else { return }
        let route = store.state.navigationState.route + [Routes.face.rawValue]
        let dataAction = SetRouteSpecificData(route: route, data: tag)
        let routeAction = SetRouteAction(route)

        store.dispatch(dataAction)
        store.dispatch(routeAction)
    }
}
