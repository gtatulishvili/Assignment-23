//
//  ZodiacPolarViewController.swift
//  Assignment15
//
//  Created by Gega on 4/10/24.
//

import UIKit

class ZodiacPolarViewController: UIViewController {
    var polarZodiacName: String?
    var polarZodiacDescription: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
    }

    func setupViews() {
        
        let polarImageView = UIImageView(frame: CGRect(x: 105, y: 309, width: 165, height: 165))
        polarImageView.contentMode = .scaleAspectFill
        if let polarZodiacName = polarZodiacName {
            polarImageView.image = UIImage(named: "\(polarZodiacName).png")
        }
        view.addSubview(polarImageView)

        let polarNameLabel = UILabel(frame: CGRect(x: 143, y: 469, width: 88, height: 34))
        polarNameLabel.text = polarZodiacName
        polarNameLabel.font = UIFont(name: "Sylfaen", size: 24)
        view.addSubview(polarNameLabel)

        let descriptionTextView = UITextView(frame: CGRect(x: 24, y: 270, width: 327, height: 420))
        descriptionTextView.text = polarZodiacDescription
        descriptionTextView.font = UIFont(name: "Sylfaen", size: 14)
        view.addSubview(descriptionTextView)

    }
}
