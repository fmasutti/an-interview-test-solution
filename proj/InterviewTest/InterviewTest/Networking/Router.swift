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
            return "raw.githubusercontent.com"
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
//            Richer example
            return "/fmasutti/an-interview-test-solution/master/proj/InterviewTest/InterviewTestTests/TestResources/order1.txt"
//            No solution sample
//            return "/fmasutti/an-interview-test-solution/master/proj/InterviewTest/InterviewTestTests/TestResources/order3.txt"
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

