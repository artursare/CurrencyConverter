//
//  Rates.swift
//  Project
//
//  Created by Artūrs Āre on 04/01/2022.
//

import Foundation
import Networking


/*
 {
   "rates": {
     "JPY": 118.52,
     "USD": 1.103,
     "GBP": 0.90155
   },
   "base": "EUR",
   "date": "2019-10-10"
 }
 */

enum Currency: String, Codable {
    case JPY
    case USD
    case GBP
}

struct BaseRate: Codable, NetworkingJSONDecodable {
    
    let rates: [Currency]
    let base: String
    let date: String
}
