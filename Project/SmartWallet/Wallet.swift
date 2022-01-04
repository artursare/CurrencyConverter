//
//  Wallet.swift
//  Project
//
//  Created by Artūrs Āre on 04/01/2022.
//

import Foundation


class Wallet: ObservableObject {
    
    enum Error: Swift.Error {
        case notEnough
        case currencyNotFound //impossible
    }
    
    @Published var current: Balance

    var rates: [String: Decimal] = [:]
    
    let commission = Commision()
        
        init(current: Balance) {
            self.current = current
        }
        
        func convert(from: String, to: String, amount: Decimal) throws {
            let available = current[from] ?? 0.0
            var left = available - amount
            guard left >= 0.0 else { throw Error.notEnough }
            
            left -= commission.fee(for: amount)
            current[from] = left
            
            guard let rate = rates[to] else { throw Error.currencyNotFound }
            let got = amount * rate
            
            current[to] = got + (current[to] ?? 0.0)
            
            commission.increaseTransactions()
        }
}

extension Wallet {
    struct Commision {
        func fee(for amount: Decimal) -> Decimal {
            let perc = isFree
            ? 0.0
            : 0.007 // check for daily trans count
            
            return Decimal(perc) * amount
        }
    }
}

extension Wallet.Commision {
    func increaseTransactions() {
        UserDefaults.standard.set(transactions + 1, forKey: "transactions")
    }
    
    var transactions: Int {
        UserDefaults.standard.integer(forKey: "transactions")
    }
    
    var isFree: Bool {
        transactions < 6
    }
}
