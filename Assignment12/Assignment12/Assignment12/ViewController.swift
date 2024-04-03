//
//  ViewController.swift
//  Assignment12
//
//  Created by Gega on 4/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lcmLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let gcdResult = calculateGCD()
        let lcmResult = calculateLCM()
        
        resultLabel.text = "GCD: \(gcdResult), LCM: \(lcmResult)"
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            lcmLabel.text = "\(calculateGCD())"
        } else {
            lcmLabel.text = "\(calculateLCM())"
        }
    }
    
    func calculateGCD() -> Int {
        let firstNumber = Int(firstNumberTextField.text ?? "") ?? 0
        let secondNumber = Int(secondNumberTextField.text ?? "") ?? 0
        return gcd(firstNumber, secondNumber)
    }
    
    func calculateLCM() -> Int {
        let firstNumber = Int(firstNumberTextField.text ?? "") ?? 0
        let secondNumber = Int(secondNumberTextField.text ?? "") ?? 0
        return lcm(firstNumber, secondNumber)
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        } else {
            return gcd(b, a % b)
        }
    }
    
    func lcm(_ a: Int, _ b: Int) -> Int {
        return (a * b) / gcd(a, b)
    }
}
