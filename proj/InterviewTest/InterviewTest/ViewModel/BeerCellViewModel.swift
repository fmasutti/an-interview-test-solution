import Foundation
import UIKit

final class BeerCellViewModel {
    
    private let model: Beer
    
    init(model: Beer) {
        self.model = model
    }
    
    var beerName: String {
        return "Name: \(model.name)"
    }
    
    var beerImgLink: String {
        return model.imgLink
    }
    
    var beerABV: String {
        return "ABV: \(String(model.abv))"
    }
    
    var beerType: String {
        guard let barrelType = model.barrelType else { return "" }
        switch barrelType {
        case .Classic:
            return "Classic"
        case .Barrel:
            return "Barrel"
        }
    }
}

