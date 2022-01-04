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
    
    @Published var isLoading  = true
    
    let user: User
    let wallet: User.Wallet
    
    private let api = RatesAPI()
    private var bag = Set<AnyCancellable>()
    
    init(user: User) {
        self.user = user
        self.wallet = User.Wallet(current: user.balance)
        
        getRates()
    }
    
    //MARK: VM actions
    func convert() {
        

        
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
                
            }.store(in: &bag)
    }
}
