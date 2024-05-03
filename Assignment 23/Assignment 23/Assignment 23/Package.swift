//
//  CatFactService.swift
//  Assignment 23
//
//  Created by Gega on 5/1/24.
//

import Foundation

public struct CatFact: Codable {
    public let fact: String
    public let length: Int
}

public class CatFactService {
    public init() {}

    public func fetchCatFacts(completion: @escaping ([CatFact]?) -> Void) {
        let url = URL(string: "https://catfact.ninja/facts?limit=10")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let catFacts = try? JSONDecoder().decode([CatFact].self, from: data)
            completion(catFacts)
        }.resume()
    }
}
