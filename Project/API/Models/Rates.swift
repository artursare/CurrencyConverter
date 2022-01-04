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

struct BaseRate: Codable, NetworkingJSONDecodable {
    
    let rates: [String: Decimal]
    let base: String
    let date: String
}
