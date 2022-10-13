//
//  ViewController.swift
//  TipCalc
//
//  Created by Rodnick Gayem on 2022-10-12.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var split: String?
    var tipCalc = TipCalcBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        updateTipChangedUI(sender: sender)
        billTextField.endEditing(true)
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsNumber/100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        splitNumberLabel.text = Int(sender.value).description
        split = splitNumberLabel.text
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

        let splitNumber = Int(split ?? "2")
        let billAmount = Float(billTextField.text ?? "0")
        let tipPercent = Float(tip)
        
        tipCalc.calculateTipAmountEach(bill: billAmount!, tipPercent: tipPercent, split: splitNumber!)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.split = tipCalc.getSplit()
            destinationVC.tipPercent = tipCalc.getTipPercent()
            destinationVC.totalAmount = tipCalc.getTotalSplitValue()
        }
    }
    
    
    func updateTipChangedUI(sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
    }
    
}

