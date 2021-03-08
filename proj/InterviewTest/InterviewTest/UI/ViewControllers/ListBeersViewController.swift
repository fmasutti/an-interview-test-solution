import UIKit
import Combine

class ListBeersViewController: UIViewController, AppCoordinatorProtocol {
    
    var appCoordinator: AppCoordinator?
    
    var viewModel: ListBeerViewModel!
    private var binding = Set<AnyCancellable>()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblNoSolutionAvailable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard viewModel != nil else { fatalError() }
        setup()
    }
    
    private func setup() {
        let cellNib = UINib(nibName: BeerCell.identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: BeerCell.identifier)
        setupBinding()
        viewModel.start()
        self.title = "Produced Beers"
    }
    
    private func setupBinding() {
        viewModel.$beers.receive(on: DispatchQueue.main)
            .sink { (_) in
                self.tableView.reloadData()
                self.tableView.isHidden = self.viewModel.noSolution
                self.lblNoSolutionAvailable.isHidden = !self.viewModel.noSolution
            }.store(in: &binding)
        
        viewModel.$noSolution.receive(on: DispatchQueue.main)
            .sink { (_) in
                self.tableView.isHidden = self.viewModel.noSolution
                self.lblNoSolutionAvailable.isHidden = !self.viewModel.noSolution
                
            }.store(in: &binding)
    }
}

extension ListBeersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerCell.identifier, for: indexPath) as? BeerCell else {
            return UITableViewCell()
        }
        var modelAtRow = viewModel.beers[indexPath.row]
        modelAtRow.barrelType = viewModel.beerBatch[indexPath.row].type
        cell.viewModel = BeerCellViewModel(model: modelAtRow)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = self.viewModel.beers[indexPath.row]
//        print("row: \(indexPath.row)")
//        print("Beers: \(selectedBeer)")
        appCoordinator?.PushBeerDetails(beerModel: selectedBeer)
    }
}
