
import Foundation

protocol ProductServiceProtocol {
    func fetchProducts(for category: Endpoint, completion: @escaping (Result<[Product], ProductError>) -> Void)
}

final class ProductService: ProductServiceProtocol {
    
    internal let localDetails: LocalDetails
    
    // MARK: - Initialization
    
    init(localDetails: LocalDetails) {
        self.localDetails = localDetails
    }
    
    func fetchProducts(for category: Endpoint, completion: @escaping (Result<[Product], ProductError>) -> Void) {
        let url = localDetails.url(for: category)

        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(products))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(ProductError.decodingFailed))
                }
            }
        }
    }
}

public enum ProductError: Error {
    case fileNotFound
    case decodingFailed
}
