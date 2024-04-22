//
//  Country.swift
//  Countries
//
//  Created by Gega on 4/21/24.
//

struct Country: Decodable {
    struct Name: Decodable {
        let common: String
        let official: String
        let nativeName: [String: NativeName]?
    }

    struct NativeName: Decodable {
        let official: String
        let common: String
    }

    struct Flags: Decodable {
        let svg: String
        let png: String
    }

    let name: Name
    let flags: Flags
    let capital: [String]?
    let region: String?
    let subregion: String?
    let languages: [String: String]?
    let currencies: [String: Currency]?
    let population: Int?

    struct Currency: Decodable {
        let name: String?
        let symbol: String?
    }

    private enum CodingKeys: String, CodingKey {
        case name, flags, capital, region, subregion, languages, currencies, population
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(Name.self, forKey: .name)
        flags = try container.decode(Flags.self, forKey: .flags)
        capital = try container.decodeIfPresent([String].self, forKey: .capital)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        subregion = try container.decodeIfPresent(String.self, forKey: .subregion)
        languages = try container.decodeIfPresent([String: String].self, forKey: .languages)
        currencies = try container.decodeIfPresent([String: Currency].self, forKey: .currencies)
        population = try container.decodeIfPresent(Int.self, forKey: .population)
    }
}
