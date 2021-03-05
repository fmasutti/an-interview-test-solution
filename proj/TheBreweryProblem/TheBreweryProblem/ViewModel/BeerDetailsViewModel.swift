import Foundation
import UIKit

final class BeerDetailsViewModel {
    private let model: Beer
    
    init(model: Beer) {
        self.model = model
    }
    
    var beerName: String {
        return model.name
    }
    
    var beerImgLink: String {
        return model.imgLink
    }
    
    var beerABV: String {
        return "ABV: \(String(model.abv))"
    }
    var description: String {
        return model.description
    }
    
    func createHeaderForSection(sectionName: String) -> UILabel {
        let lblHeader = UILabel()
        lblHeader.text = sectionName
        return lblHeader
    }
    
    func addMethodsSessionIntoStackView(stackView: inout UIStackView) {
        guard let mashList = model.method?.mash,
              let method = model.method else { return }
        stackView.addArrangedSubview(createHeaderForSection(sectionName: "Methods"))
        for mash in mashList {
            if let duration = mash.duration {
                stackView.addArrangedSubview(ItemDescriptionView(name: "Duration:", description: String(duration), hiddenButtonState: false))
            }
            stackView.addArrangedSubview(ItemDescriptionView(name: "Temperature:", description: "\(mash.temp.value) - \(mash.temp.unit)"))
        }
        stackView.addArrangedSubview(ItemDescriptionView(name: "Fermentation", description: "", hiddenButtonState: false))
        stackView.addArrangedSubview(ItemDescriptionView(name: "Temperature:", description: "\(method.fermentation.temp.value) - \(method.fermentation.temp.unit)"))
    }
    
    func addHopSessionIntoStackView(stackView: inout UIStackView) {
        guard let hops = model.ingredients?.hops else { return }
        if hops.count == 0 { return }
        stackView.addArrangedSubview(createHeaderForSection(sectionName: "Hops"))
        for hop in hops {
            stackView.addArrangedSubview(ItemDescriptionView(name: "Name:", description: hop.name, hiddenButtonState: false))
            stackView.addArrangedSubview(ItemDescriptionView(name: "Amount:", description: "\(hop.amount.value) - \(hop.amount.unit)"))
            stackView.addArrangedSubview(ItemDescriptionView(name: "Add:", description: hop.add))
            stackView.addArrangedSubview(ItemDescriptionView(name: "Attribute:", description: hop.attribute))
        }
    }
    
    func addMaltSessionIntoStackView(stackView: inout UIStackView) {
        guard let maltList = model.ingredients?.malt else { return }
        stackView.addArrangedSubview(createHeaderForSection(sectionName: "Malt"))
        for malt in maltList {
            stackView.addArrangedSubview(ItemDescriptionView(name: "Name:", description: malt.name, hiddenButtonState: false))
            stackView.addArrangedSubview(ItemDescriptionView(name: "Amount:", description: "\(malt.amount.value) - \(malt.amount.unit)"))
        }
    }
}
