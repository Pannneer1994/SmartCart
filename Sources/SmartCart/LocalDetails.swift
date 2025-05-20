
import Foundation

/// A utility struct to resolve local JSON file URLs based on category endpoints.
public struct LocalDetails {
    
    /// The base directory where JSON files are located.
    let fileURL: URL
    
    /// Initializes the `LocalDetails` with a given directory URL.
    /// - Parameter fileURL: The root folder where JSON files are stored.
    public init(fileURL: URL) {
        self.fileURL = fileURL
    }
    
    /// Returns the full URL for a specific JSON file based on the endpoint.
    /// - Parameter endpoint: The category endpoint.
    /// - Returns: Full URL to the corresponding local JSON file.
    func url(for endpoint: Endpoint) -> URL {
        return fileURL.appendingPathComponent(endpoint.rawValue + ".json")
    }
}
