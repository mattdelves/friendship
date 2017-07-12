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
    let store: Store<State>
    weak var window: UIWindow?
    let navigationController: UINavigationController

    init(window: UIWindow?, store: Store<State>) {
        self.window = window
        self.store = store
        self.navigationController = UINavigationController()
    }

    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        guard let route = Routes(rawValue: routeElementIdentifier) else { fatalError() }

        switch route {
        case .tags:
            let routable = TagsRoutable(store: store)
            navigationController.pushViewController(routable.viewController, animated: true)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            completionHandler()

            return routable
        default:
            fatalError("Route not supported")
        }
    }

    func changeRouteSegment(_ from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        guard let route = Routes(rawValue: from) else { fatalError() }

        switch route {
        case .tags:
            let routable = TagsRoutable(store: store)
            navigationController.viewControllers = [routable.viewController]
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            completionHandler()

            return routable
        default:
            fatalError("Route not supported")
        }
    }
}
