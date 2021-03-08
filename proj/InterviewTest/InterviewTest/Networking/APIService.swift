import Foundation
import Alamofire

class APIService {
    // Create URLComponents with the pre defined values from API Router
    private func createComponents(router: APIRouter) -> URLComponents {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        return components
    }
    
    private func createURLRequest(router: APIRouter) -> URLRequest? {
        let components = createComponents(router: router)
        guard let url = components.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        if let headers = router.headers {
            for item in headers {
                print(item)
                urlRequest.setValue(item.value, forHTTPHeaderField: item.key)
            }
        }
        
        if let httpBody = router.httpBody {
            urlRequest.httpBody = httpBody
        }
        return urlRequest
    }
    
    // Request with json as response
    func request<T: Decodable>(router: APIRouter, result: @escaping (Result<T, Error>) -> ()) {
        guard let urlRequest = self.createURLRequest(router: router) else {
            result(.failure(APIServiceNetworkError.badURL))
            return
        }
        
        AF.request(urlRequest)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case let .success(model):
                    result(.success(model))
                case let .failure(error):
                    debugPrint(error)
                    result(.failure(error))
                }
            }
    }
    
    // Request with String as response
    func requestResponseString(router: APIRouter, result: @escaping (Result<String, Error>) -> ()) {
        guard let urlRequest = self.createURLRequest(router: router) else {
            result(.failure(APIServiceNetworkError.badURL))
            return
        }
        AF.request(urlRequest)
            .validate()
            .responseString { (response) in
                if let value = response.value {
                    result(.success(value))
                } else if let error = response.error {
                    result(.failure(error))
                }
            }
    }
}

enum APIServiceNetworkError: Error {
    case badURL
}
