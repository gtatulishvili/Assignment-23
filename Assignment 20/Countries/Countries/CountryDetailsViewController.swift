//
//  CountryDetailsViewController.swift
//  Countries
//
//  Created by Gega on 4/21/24.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    var country: Country

    let flagImageView = UIImageView()
    let nameLabel = UILabel()
    let infoLabel = UILabel()
    let mapsButton = UIButton(type: .system)
    let safariButton = UIButton(type: .system)
    let openSafariButton = UIButton(type: .system)
    

    init(country: Country) {
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupSubviews()
        configureView()
        configureFlagImageView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureFlagImageView()
    }

    

    private func setupSubviews() {

        [flagImageView, nameLabel, infoLabel, openSafariButton, mapsButton, safariButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        openSafariButton.setTitle("Open in Safari", for: .normal)
        openSafariButton.addTarget(self, action: #selector(openLink), for: .touchUpInside)

        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 200),
            flagImageView.heightAnchor.constraint(equalToConstant: 100)
            
        ])

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            openSafariButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            openSafariButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            mapsButton.topAnchor.constraint(equalTo: openSafariButton.bottomAnchor, constant: 20),
            mapsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapsButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mapsButton.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            safariButton.topAnchor.constraint(equalTo: mapsButton.bottomAnchor, constant: 20),
            safariButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            safariButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func configureFlagImageView() {
        flagImageView.layer.shadowColor = UIColor.black.cgColor
        flagImageView.layer.shadowOpacity = 0.7
        flagImageView.layer.shadowOffset = CGSize.zero
        flagImageView.layer.shadowRadius = 10
        flagImageView.layer.shadowPath = UIBezierPath(rect: flagImageView.bounds).cgPath
        flagImageView.layer.shouldRasterize = true
        flagImageView.layer.rasterizationScale = UIScreen.main.scale
    }


    private func configureView() {
        nameLabel.text = country.name.common
        let capitalText = country.capital?.first ?? "N/A"
        infoLabel.text = "Capital: \(capitalText)"
        loadFlagImage(from: country.flags.png)
    }

    
    private func loadFlagImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {

                DispatchQueue.main.async { [weak self] in
                    self?.flagImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    @objc func openMaps() {
        if let url = URL(string: "www.google.com") {
                UIApplication.shared.open(url)
            }
    }


    
    @objc func openLink() {

        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url)
        }
    }

}

