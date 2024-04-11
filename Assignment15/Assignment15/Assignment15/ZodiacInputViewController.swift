//
//  ViewController.swift
//  Assignment15
//
//  Created by Gega on 4/10/24.
//

import UIKit

class ZodiacInputViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
 
    func setupViews() {
        let nameLabel = UILabel()
        nameLabel.text = "მიშა ცაგარელის ჰაბი"
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.frame = CGRect(x: 18, y: 71, width: 229, height: 34)
        view.addSubview(nameLabel)
     
        let descriptionLabel = UITextView()
        descriptionLabel.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.frame = CGRect(x: 24, y: 125, width: 327, height: 66)
        view.addSubview(descriptionLabel)
        
        let zodiacNameLabel = UILabel()
            zodiacNameLabel.text = "ზოდიაქოს სახელი"
            zodiacNameLabel.font = UIFont.systemFont(ofSize: 16)
            zodiacNameLabel.textColor = .black
            zodiacNameLabel.textAlignment = .left

            zodiacNameLabel.frame = CGRect(x: 24, y: 150, width: 200, height: 20)

            view.addSubview(zodiacNameLabel)
    
        let zodiacTextField = UITextField()
        zodiacTextField.placeholder = "მაგ: ქალწული"
        zodiacTextField.frame = CGRect(x: 24, y: 200, width: 327, height: 44)
        view.addSubview(zodiacTextField)
     
        let nextButton = UIButton()
        nextButton.setTitle("შემდეგ", for: .normal)
        nextButton.backgroundColor = .systemPurple
        nextButton.frame = CGRect(x: 24, y: 250, width: 327, height: 44)
        nextButton.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        view.addSubview(nextButton)
     
        if let backgroundImage = UIImage(named: "galaxy") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            view.backgroundColor = .black
        }
    }

    @objc func goToNextPage() {
        let detailVC = ZodiacDetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
