import Foundation

struct BeerBatch: Equatable, CustomStringConvertible, Decodable {
    var type: BarrelType
    var batch: Int
    
    static func == (lhs: BeerBatch, rhs: BeerBatch) -> Bool {
        return
            lhs.batch == rhs.batch &&
            lhs.type == rhs.type
    }
    var description: String { return "\(batch)->\(type)"}
    
    typealias RequestedBeers = (orderOfBeers: [[BeerBatch]], mustHave: [BeerBatch])
    
    // public method that will get a batch from an order.
    static func getNewBatchFromOrder(order: String) -> [BeerBatch]? {
        
        var listOfBeersAsString = order.replacingOccurrences(of: " ", with: "")
            .components(separatedBy: "\n")

        //var listOfBeers = trimmedString.split(whereSeparator: \.isNewline)
        let numberOfTypes:Int = Int(listOfBeersAsString.first!) ?? 0
        listOfBeersAsString.removeFirst()
        
        let requestedBeers = converOrderStringToRequestedBeersObj(listOfBeersAsString: listOfBeersAsString)
        let producedBeers = produceBeers(totalAvailableToProduce: numberOfTypes, listOfRequested: requestedBeers)
        
        // return a list of produced beers sorted by batch
        return producedBeers?.sorted {
            $0.batch < $1.batch
        }
    }
    
    // Conver a list of orders from string to "RequestedBeers" objetc type.
    private static func converOrderStringToRequestedBeersObj(listOfBeersAsString: [String]) -> RequestedBeers {
        var listOfRequestedBeersFromCustumer = [[BeerBatch]]()
        var listMustHave = [BeerBatch] ()
        for customerRequest in listOfBeersAsString {
            var batch = String()
            var listOfBeersTyped = [BeerBatch]()
            for (index, customerCharacter) in customerRequest.enumerated() {
                // Check if current position is a "batch number" or a type
                if let characterAsInt = Int(String(customerCharacter)) {
                    batch.append(String(characterAsInt))
                } else {
                    if let beerType = BarrelType.init(rawValue: String(customerCharacter)),
                       let batchNumber = Int(batch) {
                        listOfBeersTyped.append(BeerBatch(type: beerType, batch: batchNumber))
                    }
                    batch.removeAll()
                    if index == customerRequest.count - 1 {
                        listOfRequestedBeersFromCustumer.append(listOfBeersTyped)
                        
                        if let requiredBeer = listOfBeersTyped.first {
                            if (customerRequest.count - 1) == 1  && !listMustHave.contains(requiredBeer) {
                                listMustHave.append(requiredBeer)
                            }
                        }
                    }
                }
            }
        }
        return RequestedBeers(listOfRequestedBeersFromCustumer, listMustHave)
    }
    
    // Method that will get a list of produced beers passing a RequestedBeers and a max total that can reproduce.
    static private func produceBeers(totalAvailableToProduce:Int, listOfRequested: RequestedBeers) -> [BeerBatch]? {
        var producedBeers = [BeerBatch]()
        
        if totalAvailableToProduce < listOfRequested.mustHave.count {
            return nil
        }
        producedBeers.append(contentsOf: listOfRequested.mustHave)
        for customerOrder in listOfRequested.orderOfBeers {
            var beersNotDelivered = 0
            for order in customerOrder {
                if listOfRequested.mustHave.contains(where: { $0.batch == order.batch}) {
                    beersNotDelivered += 1
                } else {
                    if beersNotDelivered == customerOrder.count - 1 {
                        if !producedBeers.contains(order) {
                            producedBeers.append(order)
                        }
                    } else {
                        let beer = BeerBatch(type: .Classic, batch: order.batch)
                        if !producedBeers.contains(beer) {
                            producedBeers.append(beer)
                        }
                    }
                }
            }
        }
        return producedBeers
    }
}
