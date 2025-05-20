import Foundation

/// Protocol defining the product fetching behavior
 protocol ProductServiceProtocol {
    func fetchProducts(for category: Endpoint, completion: @escaping (Result<[Product], ProductError>) -> Void)
}

/// Concrete implementation that fetches product data from local JSON files
final class ProductService: ProductServiceProtocol {
    
    // MARK: - Properties
    
    private let localDetails: LocalDetails
    
    // MARK: - Initialization
    
    init(localDetails: LocalDetails) {
        self.localDetails = localDetails
    }
    
    // MARK: - Product Fetching
    
    /// Fetches products from a local JSON file based on the selected category.
    func fetchProducts(for category: Endpoint, completion: @escaping (Result<[Product], ProductError>) -> Void) {
        let url = localDetails.url(for: category)
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let data = try Data(contentsOf: url)
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(products))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.decodingFailed))
                }
            }
        }
    }
}

/// Custom error types for product-related failures
public enum ProductError: Error {
    case fileNotFound
    case decodingFailed
}
