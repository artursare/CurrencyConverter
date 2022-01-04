//
//  User.swift
//  Project
//
//  Created by Artūrs Āre on 04/01/2022.
//

import Foundation

struct User {
    typealias Balance = [String: Decimal]
    
    // Once this comes from User API, won't contain default or hardcoded value
    let balance: Balance = ["EUR": 1000.0]
}

extension User {
    class Wallet {
        var current: Balance
        
        init(current: Balance) {
            self.current = current
        }
    }
}
