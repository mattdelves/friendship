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
    var dataSource: TagsDataSource

    let xibName = "TagsViewController"

    init(store: Store<State>, viewModel: TagsViewModel) {
        self.store = store
        self.viewModel = viewModel
        self.dataSource = TagsDataSource()

        super.init(nibName: xibName, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("unsupported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tagCell")
        tableView.dataSource = dataSource
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
        viewModel.fetch()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
}

extension TagsViewController: StoreSubscriber {
    func newState(state: State) {
        if state.tags.count > 0 {
            dataSource.tags = state.tags
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension TagsViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tag = dataSource.tags[indexPath.row]
        cell.textLabel?.text = tag
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tag = dataSource.tags[indexPath.row]
        viewModel.display(tag: tag)
    }
}
