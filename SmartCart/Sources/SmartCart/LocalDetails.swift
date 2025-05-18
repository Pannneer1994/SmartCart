import Foundation

public struct LocalDetails {
    let fileURL: URL

    public init(fileURL: URL) {
        self.fileURL = fileURL
    }

    func url(for endpoint: Endpoint) -> URL {
        fileURL.appendingPathComponent(endpoint.rawValue + ".json")
    }
}

