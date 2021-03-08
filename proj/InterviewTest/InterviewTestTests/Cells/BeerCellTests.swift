import XCTest
@testable import InterviewTest

class BeerCellTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }
    
    func testCellCustomLayout() throws {
        
        // Given
        let beer = Beer(name: "name", imgLink: "link", abv: 1.0, method: nil, ingredients: nil, barrelType: BarrelType.Barrel, description: "")
        let cell = BeerCell()
        let lblBeerName = UILabel()
        let lblBeerABV = UILabel()
        let lblBeerType = UILabel()
        let imgBeer = UIImageView()
        
        cell.lblBeerName = lblBeerName
        cell.lblBeerABV = lblBeerABV
        cell.lblBeerType = lblBeerType
        cell.imgBeer = imgBeer
        
        // When
        let cellViewModel = BeerCellViewModel(model: beer)
        cell.viewModel = cellViewModel
        
        // Then
        XCTAssertEqual(cell.lblBeerName.text, "Name: \(beer.name)")
        XCTAssertEqual(cell.lblBeerABV.text, "ABV: \(beer.abv)")
        XCTAssertEqual(cell.lblBeerType.text, "Barrel")
        XCTAssertEqual(BeerCell.identifier, "BeerCell")
        
        // When
        cell.prepareForReuse()
        
        // Then
        XCTAssertEqual(cell.lblBeerName.text, "")
        XCTAssertEqual(cell.lblBeerABV.text, "")
        XCTAssertEqual(cell.lblBeerType.text, "")
    }
}


