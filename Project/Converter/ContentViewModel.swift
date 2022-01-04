//
//  ContentViewModel.swift
//  Sample
//
//  Created by Artūrs Āre on 29/12/2021.
//

import UIKit
import Combine

final class ContentViewModel: ObservableObject {

    @Published var labelText = ""
    var buttonText = "Get me the 🆔"
    
    private let api = RatesAPI()

    private var bag = Set<AnyCancellable>()
    
    func getId() {
        labelText = "ID-zzz-xxx"
    }
    
    func getRates() {
        api.getRates()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }) { base in
                print(base.rates)
            }.store(in: &bag)
    }
}
