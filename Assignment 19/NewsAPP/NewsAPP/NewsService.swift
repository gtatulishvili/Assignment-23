//
//  NewsService.swift
//  NewsAPP
//
//  Created by Gega on 4/19/24.
//

import Foundation

class NewsService {
    func fetchNews(completion: @escaping ([Article]?) -> Void) {
        let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let apiResponse = try decoder.decode(ApiResponse.self, from: data)
                completion(apiResponse.List)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
}

struct ApiResponse: Codable {
    let List: [Article]
}
