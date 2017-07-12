//
//  FacesViewController.swift
//  Friendship
//
//  Created by Matthew Delves on 12/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit
import ReSwift

private let reuseIdentifier = "Cell"

class FacesViewController: UICollectionViewController {
    let store: Store<State>
    let tag: String
    let viewModel: FacesViewModel
    let dataSource: FacesDataStore

    init(store: Store<State>, tag: String, viewModel: FacesViewModel) {
        self.store = store
        self.tag = tag
        self.viewModel = viewModel
        self.dataSource = FacesDataStore()

        super.init(nibName: "FacesViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.dataSource = dataSource
        let nib = UINib(nibName: "FaceCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "facesCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetch()
        store.subscribe(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        store.unsubscribe(self)

        if isMovingFromParentViewController {
            viewModel.popRoute()
        }
    }

}

extension FacesViewController: StoreSubscriber {
    func newState(state: State) {
        if state.faces.count > 0 {
            dataSource.faces = state.faces
            DispatchQueue.main.async { [weak self] in
                self?.collectionView?.reloadData()
            }
        }
    }
}

extension FacesViewController {
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let faceCell = cell as? FaceCell else { return }

        let face = dataSource.faces[indexPath.item]
        faceCell.display(image: face.image)
    }
}

extension FacesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
