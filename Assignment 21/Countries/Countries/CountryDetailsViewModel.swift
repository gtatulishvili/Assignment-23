//
//  CountryDetailsViewModel.swift
//  Countries
//
//  Created by Gega on 4/26/24.
//

import Foundation

class CountryDetailsViewModel {
    let country: Country

    init(country: Country) {
        self.country = country
    }

    var countryName: String {
        return country.name.common
    }

    var capitalName: String {
        return country.capital?.first ?? "N/A"
    }

    var flagURL: String {
        return country.flags.png
    }
}
