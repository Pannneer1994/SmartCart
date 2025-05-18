
import Foundation

public struct Product: Codable, Identifiable {
    public let id: String
    public let name: String
    public let category: String
    public let price: Double
    public let imageURL: String
    public let shortDescription: String
}

public enum Endpoint: String {
    case books, electronics, fashion, sports, groceries
}
