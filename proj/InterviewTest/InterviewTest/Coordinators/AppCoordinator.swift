import Foundation
import UIKit

final class AppCoordinator {
    private let navigationController: UINavigationController
    private let apiService: APIService
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.apiService = APIService()
    }
    
    func start() {
        let viewModel = ListBeerViewModel(apiService: apiService)
        let listBeerVC = ListBeersViewController.loadFromNib()
        listBeerVC.viewModel = viewModel
        listBeerVC.appCoordinator = self
        navigationController.navigationItem.title = "Beers"
        navigationController.pushViewController(listBeerVC, animated: false)
    }
    
    func PushBeerDetails(beerModel: Beer) {
        let viewModel = BeerDetailsViewModel(model: beerModel)
        let beerDetailVC = BeerDetailsViewController.loadFromNib()
        beerDetailVC.viewModel = viewModel
        navigationController.pushViewController(beerDetailVC, animated: true)
    }
}

protocol AppCoordinatorProtocol {
    var appCoordinator: AppCoordinator? { get set }
}
