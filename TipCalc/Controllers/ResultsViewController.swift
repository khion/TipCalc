//
//  ResultsViewController.swift
//  TipCalc
//
//  Created by Rodnick Gayem on 2022-10-12.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalAmount: String?
    var split: Int?
    var tipPercent: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        
        totalLabel.text = totalAmount
        settingsLabel.text = "Split between \(String(describing: split!)) people, with \(tipPercent!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
