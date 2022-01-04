//
//  User.swift
//  Project
//
//  Created by Artūrs Āre on 04/01/2022.
//

import Foundation

typealias Balance = [String: Decimal]

struct User {
    
    // Once this comes from User API, won't contain default or hardcoded value
    let balance: Balance = ["EUR": 1000.0]
}
