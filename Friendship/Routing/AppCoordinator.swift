//
//  AppCoordinator.swift
//  Friendship
//
//  Created by Matthew Delves on 10/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter

final class AppCoordinator {
    var router: Router<State>?
    var store: Store<State> = Store<State>(reducer: stateReducer, state: nil)

    init(window: UIWindow?) {
        let rootRoutable = RootRoutable(window: window, store: store)

        router = Router(store: store, rootRoutable: rootRoutable) { state in
            state.select { $0.navigationState }
        }
    }

    func start() {
        let route = [Routes.tags.rawValue]
        store.dispatch(SetRouteAction(route))
    }
}
