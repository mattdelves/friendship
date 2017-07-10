//
//  TagsViewController.swift
//  Friendship
//
//  Created by Matthew Delves on 10/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit
import ReSwift

class TagsViewController: UITableViewController {
    var store: Store<State>
    var viewModel: TagsViewModel

    let xibName = "TagsViewController"

    init(store: Store<State>, viewModel: TagsViewModel) {
        self.store = store
        self.viewModel = viewModel

        super.init(nibName: xibName, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("unsupported")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension TagsViewController: StoreSubscriber {
    func newState(state: State) {

    }
}
