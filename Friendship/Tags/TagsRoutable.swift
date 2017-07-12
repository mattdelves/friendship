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
    var viewController: TagsViewController

    init(store: Store<State>) {
        let viewModel = TagsViewModel(store: store)
        viewController = TagsViewController(store: store, viewModel: viewModel)
    }

//    func popRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) {
//        <#code#>
//    }
//
//    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
//        <#code#>
//    }
//
//    func changeRouteSegment(_ from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
//        <#code#>
//    }
}
