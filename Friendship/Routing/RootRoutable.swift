//
//  RootRoutable.swift
//  Friendship
//
//  Created by Matthew Delves on 10/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter

final class RootRoutable: Routable {
    var store: Store<State>
    weak var window: UIWindow?

    init(window: UIWindow?, store: Store<State>) {
        self.window = window
        self.store = store
    }

//    func popRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) {
//        <#code#>
//    }

    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        guard let route = Routes(rawValue: routeElementIdentifier) else { fatalError() }

        switch route {
        case .tags:
            let routable = TagsRoutable(store: store)
            window?.rootViewController = routable.viewController
            window?.makeKeyAndVisible()
            completionHandler()

            return routable
        }
    }

    func changeRouteSegment(_ from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        guard let route = Routes(rawValue: from) else { fatalError() }

        switch route {
        case .tags:
            let routable = TagsRoutable(store: store)
            window?.rootViewController = routable.viewController
            window?.makeKeyAndVisible()
            completionHandler()

            return routable
        }
    }
}
