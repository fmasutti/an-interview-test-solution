@testable import TheBreweryProblem
import Foundation
import OHHTTPStubs
import OHHTTPStubsSwift

protocol RequestStubProtocol {
    
    func stubRequestFor(router: APIRouter, path:String, jsonFile:String) {
        stub(condition: isHost(router.host) && isPath(router.path) ) { _ in
            guard let stubPath = OHPathForFile(jsonFile, type(of: self)) else {
                preconditionFailure("Stub didn't find json")
            }
            return fixture(filePath: stubPath, headers: ["Content-Type":"application/json"])
        }
    }
}
