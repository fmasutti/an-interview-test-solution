import Foundation
import Combine

final class ListBeerViewModel: ProducedBeersProtocol {
    
    private let apiService: APIService
    var subscriptions = Set<AnyCancellable>()
    @Published var beers = [Beer]()
    @Published var noSolution = false
    var beerBatch = [BeerBatch]()
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func start() {
        fetchData()
    }
    
    // Fetch data to get a list of beers to produce.
    private func fetchData() {
        self.checkProducedBeer { [weak self] (response: Result<[BeerBatch], Error>) in
            switch response {
            case let .success(beerBatch):
                self?.beerBatch = beerBatch
                self?.fetchBeerToProduceInfo()
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    private func fetchBeerToProduceInfo() {
        // Check ID of beers that will be produced
        var stringOfIds = String()
        for itemToProduce in beerBatch {
            if stringOfIds.isEmpty {
                stringOfIds.append(String(itemToProduce.batch))
            } else {
                stringOfIds.append("|\(itemToProduce.batch)")
            }
        }
        apiService.request(router: .getBeers(ids: stringOfIds)) { [weak self] (response: Result<[Beer], Error>) in
            switch response {
            case let .success(returnedListBeer):
                self?.beers = returnedListBeer
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    func checkProducedBeer(result: @escaping (Result<[BeerBatch], Error>) -> ()) {
        apiService.requestResponseString(router: .getOrders) { [weak self] (response: Result<String, Error>) in
            switch response {
            case let .success(oderStr):
                guard let production = BeerBatch.getNewBatchFromOrder(order: oderStr) else {
                    debugPrint("No solution exists")
                    self?.noSolution = true
                    return
                }
                result(.success(production))
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
}

protocol ProducedBeersProtocol {
    func checkProducedBeer(result: @escaping (Result<[BeerBatch], Error>) -> ())
}
