import XCTest
@testable import TheBreweryProblem

class BeerBatchTests: XCTestCase {

    override func setUpWithError() throws { }
    override func tearDownWithError() throws { }
    
    func loadFileLocalFile(fileName: String) -> String? {
       guard let path = Bundle.main.path(forResource: fileName, ofType: "txt"),
              let fileContent = try? String(contentsOfFile: path) else { return nil }
        return fileContent
    }
    
    func testBeerBatch() {
        // Given
        var beerBatch: BeerBatch!
        
        // When
        beerBatch = BeerBatch(type: BarrelType.Barrel, batch: 1)
        
        // Then
        XCTAssertEqual(beerBatch.type, BarrelType.Barrel)
        XCTAssertEqual(beerBatch.batch, 1)
    }
    
    func testGetNewBatchFromOrder() throws {
        // Given
        let order = loadFileLocalFile(fileName: "order1")
        
        // When
        let beerBatch = BeerBatch.getNewBatchFromOrder(order: order!)!
        
        // Then
        XCTAssertEqual(beerBatch[0].type, BarrelType.Classic)
        XCTAssertEqual(beerBatch[0].batch, 1)
        XCTAssertEqual(beerBatch[1].type, BarrelType.Barrel)
        XCTAssertEqual(beerBatch[1].batch, 2)
        XCTAssertEqual(beerBatch[2].type, BarrelType.Classic)
        XCTAssertEqual(beerBatch[2].batch, 3)
        XCTAssertEqual(beerBatch[3].type, BarrelType.Barrel)
        XCTAssertEqual(beerBatch[3].batch, 4)
        XCTAssertEqual(beerBatch[4].type, BarrelType.Classic)
        XCTAssertEqual(beerBatch[4].batch, 5)
    }
    
    func testGetNewBatchFromOrderCase2() throws {
        // Given
        let order = loadFileLocalFile(fileName: "order2")
        
        // When
        let beerBatch = BeerBatch.getNewBatchFromOrder(order: order!)!
        
        // Then
        XCTAssertEqual(beerBatch[0].type, BarrelType.Classic)
        XCTAssertEqual(beerBatch[0].batch, 1)
        XCTAssertEqual(beerBatch[1].type, BarrelType.Classic)
        XCTAssertEqual(beerBatch[1].batch, 2)
        XCTAssertEqual(beerBatch[2].type, BarrelType.Classic)
        XCTAssertEqual(beerBatch[2].batch, 3)
        XCTAssertEqual(beerBatch[3].type, BarrelType.Classic)
        XCTAssertEqual(beerBatch[3].batch, 4)
        XCTAssertEqual(beerBatch[4].type, BarrelType.Barrel)
        XCTAssertEqual(beerBatch[4].batch, 5)
    }
    
    func testGetNewBatchFromOrderCase3() throws {
        // Given
        let order = loadFileLocalFile(fileName: "order3")
        
        // When
        let beerBatch = BeerBatch.getNewBatchFromOrder(order: order!)
        
        // Then
        XCTAssertNil(beerBatch)
        debugPrint("testGetNewBatchFromOrderCase3 - No solution exists")
    }
    
    func testGetNewBatchFromOrderCase4() throws {
        // Given
        let order = loadFileLocalFile(fileName: "order4")
        
        // When
        let beerBatch = BeerBatch.getNewBatchFromOrder(order: order!)!
        
        // Then
        XCTAssertEqual(beerBatch[0].type, BarrelType.Barrel)
        XCTAssertEqual(beerBatch[0].batch, 1)
        XCTAssertEqual(beerBatch[1].type, BarrelType.Barrel)
        XCTAssertEqual(beerBatch[1].batch, 2)
    }
}
