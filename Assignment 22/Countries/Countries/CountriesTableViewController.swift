//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Gega on 4/21/24.
//

import UIKit
import Combine

class CountriesTableViewController: UITableViewController {
    var viewModel = CountriesViewModel()
    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchCountries()
    }

    private func setupUI() {
        self.navigationItem.title = "Countries"
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryCell")
        setupSearchController()
    }

    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Countries"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func bindViewModel() {
        viewModel.$countries.receive(on: RunLoop.main).sink { [weak self] _ in
            self?.tableView.reloadData()
        }.store(in: &cancellables)

        viewModel.$filteredCountries.receive(on: RunLoop.main).sink { [weak self] _ in
            self?.tableView.reloadData()
        }.store(in: &cancellables)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.isSearchActive ? viewModel.filteredCountries.count : viewModel.countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        let country = viewModel.isSearchActive ? viewModel.filteredCountries[indexPath.row] : viewModel.countries[indexPath.row]
        cell.configure(with: country)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = viewModel.isSearchActive ? viewModel.filteredCountries[indexPath.row] : viewModel.countries[indexPath.row]
        let detailsVC = CountryDetailsViewController(viewModel: CountryDetailsViewModel(country: country))
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension CountriesTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.isSearchActive = searchController.isActive
        viewModel.searchText = searchController.searchBar.text ?? ""
    }
}
