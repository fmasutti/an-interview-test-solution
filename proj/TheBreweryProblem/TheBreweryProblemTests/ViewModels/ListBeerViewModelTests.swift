import XCTest
@testable import TheBreweryProblem

class ListBeerViewModelTests: XCTestCase {

    override func setUpWithError() throws { }
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testViewModelValidListBeers() {
        // Given
        let mockedAPI = MockedAPIService()
        let viewModel = ListBeerViewModel(apiService: mockedAPI)
        
        // When
        viewModel.start()
        
        // Then
        XCTAssertEqual(viewModel.beers.count, 5)
        XCTAssertEqual(viewModel.beerBatch.count, 5)
        XCTAssertEqual(viewModel.noSolution, false)
    }
    
    func testViewModelNoSolution() {
        // Given
        let mockedAPI = MockedAPIService()
        mockedAPI.orders = "order3"
        let viewModel = ListBeerViewModel(apiService: mockedAPI)
        
        // When
        viewModel.start()
        
        // Then
        XCTAssertEqual(viewModel.beers.count, 0)
        XCTAssertEqual(viewModel.noSolution, true)
    }
}


class MockedAPIService: APIService {
    var beerJson: String?
    var orders: String?
    override func request<T>(router: APIRouter, result: @escaping (Result<T, Error>) -> ()) where T : Decodable {
        var model: T!
        switch router {
        case .getOrders:
            print("Orders are handled just as TEXT")
        case .getBeers(_):
            model = loadFileAsJson(fileName: beerJson ?? "beers")
            result(.success((model)))
        }
    }
    
    override func requestResponseString(router: APIRouter, result: @escaping (Result<String, Error>) -> ()) {
        var model: String!
        switch router {
        case .getOrders:
            model = loadFileAsString(fileName: orders ?? "order1")
            result(.success((model)))
        case .getBeers(_):
            print("Beers are handled just as JSON")
        }
    }
    
    func loadFileAsJson<T: Decodable>(fileName: String) -> T? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json"),
              let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return nil}
        
        return try? JSONDecoder().decode(T.self, from: jsonData)
    }
    
    func loadFileAsString(fileName: String) -> String? {
       guard let path = Bundle.main.path(forResource: fileName, ofType: "txt"),
              let fileContent = try? String(contentsOfFile: path) else { return nil }
        return fileContent
    }
}
