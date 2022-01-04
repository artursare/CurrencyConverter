//
//  Decimal+Currency.swift
//  Project
//
//  Created by Artūrs Āre on 04/01/2022.
//

import Foundation

extension Decimal {
    
    var asCurrencyString: String? {
        NumberFormatter.moneyFormatter.string(from: self as NSDecimalNumber)
    }
}
