
import Foundation

public protocol ProductManagerProtocol {
    func getProducts(for category: ProductCategory, completion: @escaping (Result<[Product], ProductError>) -> Void)
}

public final class ProductManager: ProductManagerProtocol {
    private let service: ProductServiceProtocol
    
    init(localDetails: LocalDetails) {
        self.service = ProductSecvice(localDetails: localDetails)
    }

    public init(service: ProductServiceProtocol = ProductService()) {
        self.service = service
    }

    public func getProducts(for category: ProductCategory, completion: @escaping (Result<[Product], ProductError>) -> Void) {
        service.fetchProducts(for: category, completion: completion)
    }
}
