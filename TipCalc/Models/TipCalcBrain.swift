//
//  TipCalcBrain.swift
//  TipCalc
//
//  Created by Rodnick Gayem on 2022-10-12.
//

import Foundation

struct TipCalcBrain {
    
    var tipCalculate: TipCalculate?
    
    func getTotalSplitValue() -> String {
        let totalAmountEach = String(format: "%.2f", tipCalculate?.billAmount ?? 0.0)
        return totalAmountEach
    }
    
    func getSplit() -> Int {
        return tipCalculate?.splitNum ?? 2
    }
    
    func getTipPercent() -> String {
        let tipPercent = (tipCalculate?.tipPercent ?? 0.0) * 100
        let tips = String(format: "%.0f", tipPercent)
        return tips
    }
    
    mutating func calculateTipAmountEach(bill: Float, tipPercent: Float, split: Int) {
        
        let totalBillAmount = bill * (1 + tipPercent)
        let totalSplitAmount = totalBillAmount / Float(split)
        
        tipCalculate = TipCalculate(billAmount: totalSplitAmount, tipPercent: tipPercent, splitNum: split)
    }
}
