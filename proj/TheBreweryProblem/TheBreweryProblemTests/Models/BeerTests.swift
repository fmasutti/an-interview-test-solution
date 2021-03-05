import XCTest
@testable import TheBreweryProblem

class BeerTests: XCTestCase {

    override func setUpWithError() throws { }
    override func tearDownWithError() throws { }
    
    func testBeer() throws {
        // Given
        var beer: Beer!
        
        // When
        beer = Beer(name: "name", imgLink: "link", abv: 1.0, method: nil, ingredients: nil, barrelType: BarrelType.Classic, description: "description")
        
        // Then
        XCTAssertEqual(beer.abv, 1.0)
        XCTAssertEqual(beer.name, "name")
        XCTAssertEqual(beer.imgLink, "link")
        XCTAssertEqual(beer.description, "description")
        XCTAssertEqual(beer.barrelType, BarrelType.Classic)
        XCTAssertNil(beer.method)
        XCTAssertNil(beer.ingredients)
    }
    
    func testBeerBatch() {
        let beerBatch = BeerBatch(type: BarrelType.Barrel, batch: 1)
        XCTAssertEqual(beerBatch.type, BarrelType.Barrel)
        XCTAssertEqual(beerBatch.batch, 1)
    }
}
