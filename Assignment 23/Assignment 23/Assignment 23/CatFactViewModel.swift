//
//  CatFactViewModel.swift
//  Assignment 23
//
//  Created by Gega on 5/3/24.
//

import Foundation
import CatFactNetwork

class CatFactViewModel: ObservableObject {
    @Published var catFacts: [CatFact] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var catFactService = CatFactService()

    func fetchFacts() {
        isLoading = true
        catFactService.fetchCatFacts { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let facts):
                    self?.catFacts = facts
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
