//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Gega on 4/21/24.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Countries"
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)
        ]
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryCell")
        
        fetchCountries()

        tableView.tableFooterView = UIView()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        let country = countries[indexPath.row]
        cell.configure(with: country)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        let detailsVC = CountryDetailsViewController(country: country)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
        override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

            let spacing: CGFloat = 8
            var cellFrame = cell.frame
            cellFrame.origin.x += spacing
            cellFrame.origin.y += spacing / 2
            cellFrame.size.width -= 2 * spacing
            cellFrame.size.height -= spacing
            cell.frame = cellFrame
            cell.contentView.backgroundColor = .white
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 25
            cell.layer.masksToBounds = true
            cell.backgroundColor = .clear
        }
    
    
}

extension CountriesTableViewController {
    func fetchCountries() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error fetching countries: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received.")
                return
            }
            
            do {
                
                let decodedResponse = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.countries = decodedResponse
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }

}
