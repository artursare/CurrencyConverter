//
//  ContentViewModel.swift
//  Sample
//
//  Created by Artūrs Āre on 29/12/2021.
//

import UIKit
import Combine
import Foundation

final class ContentViewModel: ObservableObject {

    let title = "Currency Converter"
    let balancesTitle = "My Balances"
    let exchangeTitle = "Currency Exchange"
    let sellTitle = "Sell"
    let receiveTitle = "Receive"
    let buttonTitle = "Submit"
    
    @Published var isLoading = true
    @Published var userBalances: [String] = []
    @Published var alertText: (String, String, String)? = nil
    
    // these come from UI pickers
    @Published var chosenAmount: Decimal = 10.0
    @Published var pickedCurrencyFrom: String = "EUR"
    @Published var pickedCurrencyTo: String = "USD"

    let user: User
    @Published var wallet: Wallet
    
    private let api = RatesAPI()
    private var bag = Set<AnyCancellable>()

    init(user: User) {
        self.user = user
        self.wallet = Wallet(current: user.balance)
        
        wallet.$current.sink { balance in
            self.userBalances = balance.map { "\($0.value.asCurrencyString!) \($0.key)" }
            // send the data to User API
        }.store(in: &bag)
        
        getRates()
    }

    //MARK: VM actions
    func convert() {
        
        try? wallet.convert(from: pickedCurrencyFrom, to: pickedCurrencyTo, amount: chosenAmount)
        
    }
    
    
    //MARK: Internal
    
    
    //private ?
    func getRates() {
        api.getRates()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }) { [weak self] base in
                print(base.rates)
                self?.isLoading = false
                self?.wallet.rates = base.rates
                
            }.store(in: &bag)
    }
}
