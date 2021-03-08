import XCTest
@testable import InterviewTest

class AppCoordinatorTests: XCTestCase {

    override func setUpWithError() throws { }
    override func tearDownWithError() throws { }
    
    func testAppCoordinatorStart() throws {
        // Given
        let nav = UINavigationController()
        let appCoordinator = AppCoordinator(navigationController: nav)
        
        // When
        appCoordinator.start()
        
        // Then
        XCTAssertEqual(nav.viewControllers.first!.nibName, "ListBeersViewController")
    }
    
    func testAppCoordinatorPushDetails() throws {
        // Given
        let nav = UINavigationController()
        let appCoordinator = AppCoordinator(navigationController: nav)
        let beer = Beer(name: "title", imgLink: "link", abv: 1.0, method: nil, ingredients: nil, barrelType: .none, description: "description")
        
        // When
        appCoordinator.PushBeerDetails(beerModel: beer)
        
        // Then
        XCTAssertEqual(nav.viewControllers.first!.nibName, "BeerDetailsViewController")
    }
}
