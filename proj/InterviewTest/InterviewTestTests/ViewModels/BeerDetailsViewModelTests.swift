import XCTest
@testable import InterviewTest

class BeerDetailsViewModelTests: XCTestCase {

    override func setUpWithError() throws { }
    override func tearDownWithError() throws { }
    
    func testViewModelInterfaces() throws {
        // Given
        let beer = Beer(name: "name", imgLink: "link",
                        abv: 1.0, method: nil, ingredients: nil,
                        barrelType: .Classic, description: "description")
        
        // When
        let viewModel = BeerDetailsViewModel(model: beer)
        
        // Then
        XCTAssertEqual(viewModel.beerABV,"ABV: \(String(beer.abv))")
        XCTAssertEqual(viewModel.beerImgLink, beer.imgLink)
        XCTAssertEqual(viewModel.beerName, beer.name)
        XCTAssertEqual(viewModel.description, beer.description)
    }
    
    func testCreateHeader() {
        // Given
        let mockedBeer = Beer(name: "name", imgLink: "link", abv: 1.0, method: nil, ingredients: nil, barrelType: .Classic, description: "description")
        let viewModel = BeerDetailsViewModel(model: mockedBeer)
        
        // When
        let lblHeader = viewModel.createHeaderForSection(sectionName: "headerName")
        
        // Then
        XCTAssertEqual(lblHeader.text, "headerName")
    }
    
    func testAddEmptySessions() {
        // Given
        let mockedBeer = Beer(name: "name", imgLink: "link", abv: 1.0, method: nil, ingredients: nil, barrelType: .Classic, description: "description")
        let viewModel = BeerDetailsViewModel(model: mockedBeer)
        var stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        //When
        viewModel.addMethodsSessionIntoStackView(stackView: &stackView)
        viewModel.addHopSessionIntoStackView(stackView: &stackView)
        viewModel.addMaltSessionIntoStackView(stackView: &stackView)
        
        // Then
        XCTAssertEqual(stackView.arrangedSubviews.count, 0, "Shouldn't add anything")
    }
    
    func testAddMethodsSessionIntoStackView() throws {
        // Given
        let methods = BMethod(mash: [Mash(temp: Temperature(value: 2.0, unit: "celsius"), duration: 10)], fermentation: Fermentation(temp: Temperature(value: 2.0, unit: "celsius")))
        let mockedBeer = Beer(name: "name", imgLink: "link", abv: 1.0, method: methods, ingredients: nil, barrelType: .Classic, description: "description")
        let viewModel = BeerDetailsViewModel(model: mockedBeer)
        var stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        // When
        viewModel.addMethodsSessionIntoStackView(stackView: &stackView)
        
        // Then
        XCTAssertEqual(stackView.arrangedSubviews.count, 5, "Shouldn't add anything")
        for (index, view) in stackView.arrangedSubviews.enumerated() {
            if index == 0 { // Check custom Header
                guard let lblHeader = view as? UILabel else {
                    return XCTAssertThrowsError("The iteracted iten should be an ItemDescriptionView)")
                }
                XCTAssertEqual(lblHeader.text, "Methods")
            } else { // validate each "ItemDescriptionView" added on the StackView
                guard let _ = view as? ItemDescriptionView else {
                    return XCTAssertThrowsError("The Iteracted item should be an ItemDescriptionView class")
                }
            }
        }
    }
    
    func testAddMaltSessionIntoStackView() throws {
        // Given
        let amount = Amount(value: 1.0, unit: "celsius")
        let ingredients = Ingredients(malt: [Malt(name: "name", amount: amount)], hops: [Hops(name: "name", amount: amount, add: "start", attribute: "attribute")], yeast: "yeast")
        let mockedBeer = Beer(name: "name", imgLink: "link", abv: 1.0, method: nil, ingredients: ingredients, barrelType: .Classic, description: "description")
        let viewModel = BeerDetailsViewModel(model: mockedBeer)
        var stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        // When
        viewModel.addMaltSessionIntoStackView(stackView: &stackView)
        
        // Then
        XCTAssertEqual(stackView.arrangedSubviews.count, 3, "Shouldn't add anything")
        for (index, view) in stackView.arrangedSubviews.enumerated() {
            if index == 0 { // Check custom Header
                guard let lblHeader = view as? UILabel else {
                    return XCTAssertThrowsError("The iteracted iten should be an ItemDescriptionView)")
                }
                XCTAssertEqual(lblHeader.text, "Malt")
            } else { // validate each "ItemDescriptionView" added on the StackView
                guard let _ = view as? ItemDescriptionView else {
                    return XCTAssertThrowsError("The Iteracted item should be an ItemDescriptionView class")
                }
            }
        }
    }
    
    func testAddHopstSessionIntoStackView() throws {
        // Given
        let amount = Amount(value: 1.0, unit: "celsius")
        let ingredients = Ingredients(malt: [Malt(name: "name", amount: amount)], hops: [Hops(name: "name", amount: amount, add: "start", attribute: "attribute")], yeast: "yeast")
        let mockedBeer = Beer(name: "name", imgLink: "link", abv: 1.0, method: nil, ingredients: ingredients, barrelType: .Classic, description: "description")
        let viewModel = BeerDetailsViewModel(model: mockedBeer)
        var stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        // When
        viewModel.addHopSessionIntoStackView(stackView: &stackView)
        
        // Then
        XCTAssertEqual(stackView.arrangedSubviews.count, 5, "Shouldn't add anything")
        for (index, view) in stackView.arrangedSubviews.enumerated() {
            if index == 0 { // Check custom Header
                guard let lblHeader = view as? UILabel else {
                    return XCTAssertThrowsError("The iteracted iten should be an ItemDescriptionView)")
                }
                XCTAssertEqual(lblHeader.text, "Hops")
            } else { // validate each "ItemDescriptionView" added on the StackView
                guard let _ = view as? ItemDescriptionView else {
                    return XCTAssertThrowsError("The Iteracted item should be an ItemDescriptionView class")
                }
            }
        }
    }
}
