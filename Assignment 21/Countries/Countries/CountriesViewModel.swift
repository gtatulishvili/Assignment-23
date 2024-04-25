//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Gega on 4/26/24.
//

import Foundation

class CountriesViewModel {
    @Published var countries: [Country] = []
    @Published var filteredCountries: [Country] = []

    var isSearchActive: Bool = false
    var searchText: String = "" {
        didSet {
            filterCountries()
        }
    }

    func fetchCountries() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard let data = data else {
                // Handle no data scenario
                return
            }
            do {
                let decodedResponse = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.countries = decodedResponse
                }
            } catch {
                // Handle decoding error
            }
        }.resume()
    }

    private func filterCountries() {
        if searchText.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter { $0.name.common.lowercased().hasPrefix(searchText.lowercased()) }
        }
    }
}
