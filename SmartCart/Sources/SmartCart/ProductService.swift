
import Foundation

protocol ProductServiceProtocol {
    func fetchProducts(for category: ProductCategory, completion: @escaping (Result<[Product], Error>) -> Void)
}

final class ProductService: ProductServiceProtocol {
    
    internal let localDetails: LocalDetails
    
    // MARK: - Initialization
    
    init(localDetails: LocalDetails) {
        self.localDetails = localDetails
    }
    
    func fetchProducts(for category: Endpoint, completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = localDetails.url(for: category) else {
            completion(.failure(ProductError.fileNotFound))
            return
        }

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
