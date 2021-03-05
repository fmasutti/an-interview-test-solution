import Foundation

enum BarrelType: String, Decodable {
    case Classic = "C"
    case Barrel = "B"
}
//struct Beer2: Decodable {
//    var name: String
//    var temperature = {
//        var unit: String
//    }
//}

struct Beer: Decodable {
    var name: String
    var imgLink: String
    var abv: Float
    var method: BMethod?
    var ingredients: Ingredients?
    var barrelType: BarrelType?
    var description: String
    
    private enum CodingKeys : String, CodingKey {
        case name
        case imgLink = "image_url"
        case abv
        case method
        case ingredients
        case description
    }
}

struct Fermentation: Decodable {
    var temp: Temperature
}

struct Temperature: Decodable {
    var value: Float
    var unit: String
}

struct Malt: Decodable {
    var name: String
    var amount: Amount
}

struct Hops: Decodable {
    var name: String
    var amount: Amount
    var add: String
    var attribute: String
}

struct Mash: Decodable {
    var temp:Temperature
    var duration: Int?
}

struct Amount: Decodable {
    var value: Float
    var unit: String
}

struct BMethod: Decodable {
    var mash: [Mash]
    var fermentation: Fermentation
    private enum CodingKeys : String, CodingKey {
        case mash = "mash_temp"
        case fermentation
    }
}

struct Ingredients: Decodable {
    var malt: [Malt]
    var hops: [Hops]
    var yeast: String
}
