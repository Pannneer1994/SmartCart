import Foundation

/// Protocol that defines the interface for fetching products.
public protocol ProductManagerProtocol {
    
    /// Fetches products for a given category.
    /// - Parameters:
    ///   - category: The selected product category.
    ///   - completion: Completion handler with a result containing either a list of `Product` or a `ProductError`.
    func getProducts(for category: Endpoint, completion: @escaping (Result<[Product], ProductError>) -> Void)
}

/// A concrete implementation of `ProductManagerProtocol` that uses a service to fetch products.
public final class ProductManager: ProductManagerProtocol {
    
    /// The internal service used to perform the actual product fetching.
    private let service: ProductServiceProtocol
    
    /// Initializes the manager with local resource details.
    /// - Parameter localDetails: An instance of `LocalDetails` pointing to the resource folder.
    public init(localDetails: LocalDetails) {
        self.service = ProductService(localDetails: localDetails)
    }
    
    /// Fetches products for the selected category by delegating to the service layer.
    /// - Parameters:
    ///   - category: The selected category.
    ///   - completion: Completion handler returning the result of the fetch operation.
    public func getProducts(for category: Endpoint, completion: @escaping (Result<[Product], ProductError>) -> Void) {
        service.fetchProducts(for: category, completion: completion)
    }
}
