//
//  CountryDetailsViewController.swift
//  Countries
//
//  Created by Gega on 4/21/24.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    var viewModel: CountryDetailsViewModel!

    private let flagImageView = UIImageView()
    private let nameLabel = UILabel()
    private let infoLabel = UILabel()

    init(viewModel: CountryDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureView()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupSubviews()
    }

    private func setupSubviews() {
        [flagImageView, nameLabel, infoLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 200),
            flagImageView.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func configureView() {
        nameLabel.text = viewModel.countryName
        infoLabel.text = "Capital: \(viewModel.capitalName)"
        loadFlagImage(from: viewModel.flagURL)
    }

    private func loadFlagImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self?.flagImageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
