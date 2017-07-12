//
//  FaceCell.swift
//  Friendship
//
//  Created by Matthew Delves on 12/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit
import BrightFutures

class FaceCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    var invalidationToken: InvalidationToken = InvalidationToken()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        invalidationToken.invalidate()
        invalidationToken = InvalidationToken()
        image.image = nil
    }

    func display(image: String) {
        guard let url = URL(string: image) else { return }

        fetch(url: url).onSuccess(invalidationToken.validContext(DispatchQueue.main.context)) { [weak self] imageData in
            self?.image.image = UIImage(data: imageData)
        }
    }

    func fetch(url: URL) -> Future<Data, APIError> {
        let session = URLSession.shared

        let promise = Promise<Data, APIError>()

        let task = session.dataTask(with: url) { data, _, error in
            if error != nil {
                promise.failure(.server)
                return
            }

            if let data = data {
                promise.success(data)
            } else {
                promise.failure(.noData)
            }
        }

        task.resume()

        return promise.future
    }
}
