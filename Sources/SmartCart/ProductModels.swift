
import Foundation

/// A model representing a product in the SmartCart system.
public struct Product: Codable, Identifiable {
    public let id: String
    public let name: String
    public let category: String
    public let price: Double
    public let imageURL: String
    public let shortDescription: String
}

/// Supported product categories for SmartCart.
public enum Endpoint: String, CaseIterable, Codable {
    case books
    case electronics
    case fashion
    case sports
    case groceries
}
