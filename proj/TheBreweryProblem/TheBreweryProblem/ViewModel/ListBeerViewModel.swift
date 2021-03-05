import Foundation
import Combine

final class ListBeerViewModel: ProducedBeersProtocol {
    
    private let apiService: APIService
    var subscriptions = Set<AnyCancellable>()
    @Published var beers = [Beer]()
    var beerBatch = [BeerBatch]()
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func start() {
        fetchData()
    }
    
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
        apiService.requestResponseString(router: .getOrders) { (response: Result<String, Error>) in
            switch response {
            case let .success(oderStr):
                guard let production = BeerBatch.getNewBatchFromOrder(order: oderStr) else { return }
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
