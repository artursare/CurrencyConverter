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
    
    @Published var isLoading = true
    @Published var userBalances: [String] = []
    @Published var alertText: (String, String, String)? = nil
    
    //TODO: Wire from UI poicker
    @Published var chosenAmount: Decimal = 10.0
    @Published var pickedCurrencyFrom: String = "EUR"
    @Published var pickedCurrencyTo: String = "USD"

    @Published var converter: Converter

    private let user: User
    private let api = RatesAPI()
    
    private var bag = Set<AnyCancellable>()

    init(user: User) {
        self.user = user
        self.converter = Converter(current: user.balance)
        
        converter.$balance.sink { balance in
            self.userBalances = balance.map { "\($0.value.asCurrencyString!) \($0.key)" }
            //TODO: send the new balance to User API
        }.store(in: &bag)
        
        getRates()
    }

    //MARK: VM actions
    func convert() {
        try? converter.convert(from: pickedCurrencyFrom, to: pickedCurrencyTo, amount: chosenAmount)
    }
    
    //MARK: Private
    private func getRates() {
        api.getRates()
            .sink(receiveCompletion: { _ in }) { [weak self] base in
                self?.finishedLoading(rates: base.rates)
            }.store(in: &bag)
    }
    
    private func finishedLoading(rates: [String : Decimal]) {
        isLoading = false
        converter.rates = rates
        print(rates)
    }
}
