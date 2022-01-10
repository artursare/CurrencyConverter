//
//  Converter.swift
//  Project
//
//  Created by Artūrs Āre on 04/01/2022.
//

import Foundation

class Converter: ObservableObject {
    
    enum Error: Swift.Error {
        case notEnough
        case currencyNotFound
    }
    
    @Published var balance: Balance
    
    var rates: [String: Decimal] = [:]
    
    init(current: Balance) {
        self.balance = current
    }
    
    func convert(from: String, to: String, amount: Decimal) throws {
        let available = balance[from] ?? 0.0
        let left = available - amount
        guard left >= 0.0 else { throw Error.notEnough }
        
        balance[from] = left
        
        guard let rate = rates[to] else { throw Error.currencyNotFound }
        let got = amount * rate
        
        balance[to] = got + (balance[to] ?? 0.0)
    }
}
