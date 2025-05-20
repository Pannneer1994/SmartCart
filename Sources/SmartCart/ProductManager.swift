
import Foundation

public protocol ProductManagerProtocol {
    func getProducts(for category: Endpoint, completion: @escaping (Result<[Product], ProductError>) -> Void)
}

public final class ProductManager: ProductManagerProtocol {
    private let service: ProductServiceProtocol
    
    public init(localDetails: LocalDetails) {
        self.service = ProductService(localDetails: localDetails)
    }
    
    public func getProducts(for category: Endpoint, completion: @escaping (Result<[Product], ProductError>) -> Void) {
        service.fetchProducts(for: category, completion: completion)
    }
}
