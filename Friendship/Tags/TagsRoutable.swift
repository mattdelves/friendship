//
//  TagsRoutable.swift
//  Friendship
//
//  Created by Matthew Delves on 10/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import ReSwift
import ReSwiftRouter

final class TagsRoutable: Routable {
    let viewController: TagsViewController
    let store: Store<State>

    init(store: Store<State>) {
        let viewModel = TagsViewModel(store: store)
        viewController = TagsViewController(store: store, viewModel: viewModel)
        self.store = store
    }

    func popRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) {
        guard let route = Routes(rawValue: routeElementIdentifier) else { fatalError() }

        switch route {
        case .face:
            completionHandler()
        default:
            fatalError("route not supported")
        }
    }

    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        guard let route = Routes(rawValue: routeElementIdentifier) else { fatalError() }

        switch route {
        case .face:
            // Get route specific state
            let route = store.state.navigationState.route
            guard let tag: String = store.state.navigationState.getRouteSpecificState(route) else { fatalError("no route specific state")}

            let router = FacesRouter(store: store, tag: tag)

            viewController.navigationController?.pushViewController(router.viewController, animated: true)
            completionHandler()

            return router

        default:
            fatalError("Can't handle route")
        }
    }
//
//    func changeRouteSegment(_ from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
//        <#code#>
//    }
}
