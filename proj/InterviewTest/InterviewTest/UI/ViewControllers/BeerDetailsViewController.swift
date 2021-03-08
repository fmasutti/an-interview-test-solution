import Foundation
import UIKit

class BeerDetailsViewController: UIViewController {
    
    weak var downloadImgTask: URLSessionTask?
    var viewModel: BeerDetailsViewModel!
    
    @IBOutlet weak var imgBeer: UIImageView!
    @IBOutlet weak var lblABV: UILabel!
    @IBOutlet weak var txtViewDescription: UITextView!
    @IBOutlet weak var stackViewDetails: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard viewModel != nil else { fatalError() }
        setup()
    }
    
    private func setup() {
        self.title = viewModel.beerName
        lblABV.text =  viewModel.beerABV
        txtViewDescription.text = viewModel.description
        downloadImgTask = self.imgBeer.downloaded(from: viewModel.beerImgLink)
        setupIgredientLists()
    }
    
    private func setupIgredientLists ()  {
        viewModel.addMethodsSessionIntoStackView(stackView: &stackViewDetails)
        viewModel.addHopSessionIntoStackView(stackView: &stackViewDetails)
        viewModel.addMaltSessionIntoStackView(stackView: &stackViewDetails)
    }
}
