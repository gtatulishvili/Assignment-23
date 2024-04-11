//
//  ZodiacDetailViewController.swift
//  Assignment15
//
//  Created by Gega on 4/10/24.
//

import UIKit

class ZodiacDetailViewController: UIViewController {
    var zodiacName: String?
    var zodiacDescription: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
    }

    func setupViews() {
        let zodiacImageView = UIImageView(frame: CGRect(x: 109, y: 55, width: 156, height: 156))
        zodiacImageView.contentMode = .scaleAspectFill
        if let zodiacName = zodiacName {
            zodiacImageView.image = UIImage(named: "\(zodiacName).png")
        }
        view.addSubview(zodiacImageView)

        let zodiacNameLabel = UILabel(frame: CGRect(x: 130, y: 206, width: 110, height: 34))
        zodiacNameLabel.text = zodiacName
        zodiacNameLabel.font = UIFont(name: "Sylfaen", size: 24)
        view.addSubview(zodiacNameLabel)

        let descriptionTextView = UITextView(frame: CGRect(x: 24, y: 270, width: 327, height: 420))
        descriptionTextView.text = zodiacDescription
        descriptionTextView.font = UIFont(name: "Sylfaen", size: 14)
        view.addSubview(descriptionTextView)

        let polarSignButton = UIButton(frame: CGRect(x: 20, y: 736, width: 335, height: 46))
        polarSignButton.setTitle("პოლარული ნიშანი", for: .normal)
        polarSignButton.backgroundColor = UIColor.systemPurple
        polarSignButton.addTarget(self, action: #selector(viewPolarSign), for: .touchUpInside)
        view.addSubview(polarSignButton)
    }

    @objc func viewPolarSign() {
        let polarViewController = ZodiacPolarViewController()
        navigationController?.pushViewController(polarViewController, animated: true)
    }
}

