import XCTest
@testable import InterviewTest

class BeerCellViewModelTests: XCTestCase {

    override func setUpWithError() throws { }
    override func tearDownWithError() throws { }
    
    func testViewModelInterfaces() {
        var beer = Beer(name: "name", imgLink: "link",
                        abv: 1.0, method: nil, ingredients: nil,
                        barrelType: .Classic, description: "description")
        var viewModel = BeerCellViewModel(model: beer)
        XCTAssertEqual(viewModel.beerABV,"ABV: \(String(beer.abv))")
        XCTAssertEqual(viewModel.beerImgLink, beer.imgLink)
        XCTAssertEqual(viewModel.beerName, "Name: \(beer.name)")
        XCTAssertEqual(viewModel.beerType, "Classic")
        
        beer.barrelType = .Barrel
        viewModel = BeerCellViewModel(model: beer)
        XCTAssertEqual(viewModel.beerType, "Barrel")
    }
}
