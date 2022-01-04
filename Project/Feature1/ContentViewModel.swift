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
    
    private let api = SampleAPI()

    private var bag = Set<AnyCancellable>()
    
    func getId() {
        labelText = "ID-zzz-xxx"
    }
    
    func sendPhoto() {
        api.validate(data: Data())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }) { document in
                print(document)
            }.store(in: &bag)
    }
}
