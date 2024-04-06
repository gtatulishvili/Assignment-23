//
//  ViewController.swift
//  Assignment13
//
//  Created by Gega on 4/5/24.
//

import UIKit


struct Coffee {
    var productName: String
    var productDescription: String
    var productDescription2: String
    var rating: Double
    var reviewCount: Int
    var price: Double
    var imageName: String
}

class ViewController: UIViewController {


    @IBOutlet weak var coffeeImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBOutlet weak var productRatingLabel: UILabel!
    
    @IBOutlet weak var productDescriptionNameLabel: UILabel!
    
    @IBOutlet weak var productDescription2Label: UILabel!
    
    @IBOutlet weak var productSizeLabel: UILabel!
    
    @IBOutlet weak var smallButton: UIButton!
    
    @IBOutlet weak var MiddleButton: UIButton!
    
    @IBOutlet weak var LongButton: UIButton!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var Price: UILabel!
    
    @IBOutlet weak var PurchaseButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let exampleCoffee = Coffee(productName: "კაპუჩინო",
                                   productDescription: "შოკოლადი",
                                   productDescription2: "მოცემული კაპუჩინო არის დაახლოებით 150 მლ. ის შეიცავს 25 მლ. ესპრესოს ყავას, 85 მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც...",
                                   rating: 4.8,
                                   reviewCount: 230,
                                   price: 4.53,
                                   imageName: "coffee")
        
        
        coffeeImageView.image = UIImage(named: exampleCoffee.imageName)
        productNameLabel.text = exampleCoffee.productName
        productDescriptionLabel.text = exampleCoffee.productDescription
        productDescription2Label.text = exampleCoffee.productDescription2
        Price.text = String(format: "$%.2f", exampleCoffee.price)
        
        
        
            smallButton.setTitle("პაწა", for: .normal)
            MiddleButton.setTitle("პაწა", for: .normal)
            LongButton.setTitle("დიდი", for: .normal)

            smallButton.setTitleColor(UIColor.black, for: .normal)
            MiddleButton.setTitleColor(UIColor.black, for: .normal)
            LongButton.setTitleColor(UIColor.black, for: .normal)

            smallButton.backgroundColor = UIColor.clear
            MiddleButton.backgroundColor = UIColor.clear
            LongButton.backgroundColor = UIColor.clear

            smallButton.layer.borderWidth = 0.5
            MiddleButton.layer.borderWidth = 0.5
            LongButton.layer.borderWidth = 0.5

            smallButton.layer.borderColor = UIColor.black.cgColor
            MiddleButton.layer.borderColor = UIColor.black.cgColor
            LongButton.layer.borderColor = UIColor.black.cgColor
        
            smallButton.layer.cornerRadius = 5
            MiddleButton.layer.cornerRadius = 5
            LongButton.layer.cornerRadius = 5
        
        
            coffeeImageView.layer.cornerRadius = coffeeImageView.frame.height / 2
            coffeeImageView.layer.cornerRadius = 20
            coffeeImageView.clipsToBounds = true
    }

}

