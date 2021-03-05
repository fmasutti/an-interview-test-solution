import Foundation

enum APIRouter {
    
    typealias Headers = [String: String?]
    case getBeers (ids: String)
    case getOrders
//    private static let api_key = ""
    
    var scheme: String {
        switch self {
        case .getBeers, .getOrders:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getBeers:
            return "api.punkapi.com"
        case .getOrders:
            return "gist.githubusercontent.com"
        }
    }
    
    private var version: String {
        switch self {
        case .getBeers:
            return "v2"
        case .getOrders:
            return ""
        }
    }
    
    var path: String {
        switch self {
        case .getBeers:
            return "/\(self.version)/beers"
        case .getOrders:
            return "/LuigiPapinoDrop/d8ed153d5431bbad23e1e1c6b5ba1e3c/raw/4ec1c8064e51838240e941679d3ac063460685c2/code_challenge_richer.txt"
        }
    }
    
    
    var headers: Headers? {
        switch self {
        case .getBeers, .getOrders:
            return nil
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getBeers(let listIds):
            return [URLQueryItem(name: "ids", value: listIds)]
        case .getOrders:
            return nil
        }
    }
    
    var httpBody: Data? {
        switch self {
        case .getBeers, .getOrders:
            return nil
        }
    }
    
    var method: String {
        switch self {
        case .getBeers, .getOrders:
            return "GET"
        }
    }
}

