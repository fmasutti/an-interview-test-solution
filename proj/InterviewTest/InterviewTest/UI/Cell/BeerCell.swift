import Foundation
import UIKit

class BeerCell: UITableViewCell {
    
    @IBOutlet weak var lblBeerName: UILabel!
    @IBOutlet weak var lblBeerABV: UILabel!
    @IBOutlet weak var lblBeerType: UILabel!
    @IBOutlet weak var imgBeer: UIImageView!
    var downloadImgTask: URLSessionTask?
    
    var viewModel: BeerCellViewModel! {
        didSet {
            updateCellLayout()
        }
    }
    
    func updateCellLayout() {
        lblBeerABV.text = viewModel.beerABV
        lblBeerName.text = viewModel.beerName
        lblBeerType.text = viewModel.beerType
        downloadImgTask = imgBeer.downloaded(from: viewModel.beerImgLink)
    }
    
    static var identifier : String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblBeerABV.text = ""
        lblBeerName.text = ""
        lblBeerType.text = ""
        downloadImgTask?.cancel()
    }
}
