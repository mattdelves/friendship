//
//  FacesRouter.swift
//  Friendship
//
//  Created by Matthew Delves on 12/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import ReSwift
import ReSwiftRouter

class FacesRouter: Routable {
    let viewController: FacesViewController
    let store: Store<State>

    init(store: Store<State>, tag: String) {
        self.store = store
        let viewModel = FacesViewModel(store: store, tag: tag)
        viewController = FacesViewController(store: store, tag: tag, viewModel: viewModel)
    }
}
