//
//  DetailsViewController.swift
//  NewsAPP
//
//  Created by Gega on 4/19/24.
//

import UIKit

class DetailsViewController: UIViewController {
    var article: Article?

    let titleLabel = UILabel()
    let detailImageView = UIImageView()
    let contentTextView = UITextView()
    let timeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
        configureView()
    }

    private func setupUI() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)

        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.contentMode = .scaleAspectFill
        detailImageView.clipsToBounds = true
        view.addSubview(detailImageView)

        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.isEditable = false
        contentTextView.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(contentTextView)
        
            timeLabel.translatesAutoresizingMaskIntoConstraints = false
            timeLabel.font = UIFont.systemFont(ofSize: 16)
            timeLabel.textColor = .white
            view.addSubview(timeLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            detailImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            detailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailImageView.heightAnchor.constraint(equalToConstant: 250),

            contentTextView.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 20),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            timeLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 8),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func configureView() {
            titleLabel.text = article?.title
            contentTextView.text = "აღწერა"
            timeLabel.text = "Time: \(article?.time ?? "")"

            if let imageUrl = article?.photoUrl, let url = URL(string: imageUrl) {
                URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.detailImageView.image = image
                        }
                    }
                }.resume()
            }
        }
}
