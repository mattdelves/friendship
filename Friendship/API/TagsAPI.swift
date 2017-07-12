import BrightFutures
import Result
import Foundation

final class TagsAPI {
    var session: URLSession
    var endpoint: String

    init(endpoint: String, session: URLSession) {
        self.endpoint = endpoint
        self.session = session
    }

    func fetch() -> Future<[String], APIError> {
        guard let url = URL(string: endpoint) else {
            return Future(error: .client)
        }

        let promise = Promise<[String], APIError>()

        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                promise.failure(.server)
                return
            }

            guard let data = data, let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                promise.failure(.server)
                return
            }

            if let tags = jsonData?["tags"] as? [String] {
                promise.success(tags)
            } else {
                promise.failure(.client)
            }
        }

        task.resume()

        return promise.future
    }

    func fetch(tag: String) -> Future<[Face], APIError> {
        guard let url = URL(string: "\(endpoint):\(tag)") else {
            return Future(error: .client)
        }

        let promise = Promise<[Face], APIError>()

        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                promise.failure(.server)
                return
            }

            guard let data = data else {
                promise.failure(.noData)
                return
            }

            let decoder = JSONDecoder()
            do
            {
                let tagsResponse = try decoder.decode(TagsResponse.self, from: data)
                promise.success(tagsResponse.faces)
            } catch let error {
                print(error.localizedDescription)
                promise.failure(.client)
            }
        }

        task.resume()

        return promise.future
    }
}
