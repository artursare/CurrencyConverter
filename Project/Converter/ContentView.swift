//
//  ContentView.swift
//  Sample
//
//  Created by Artūrs Āre on 29/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: ContentViewModel

    var body: some View {
        VStack {
            Text(Strings.balancesTitle)
                .padding()
            
            List(vm.userBalances, id: \.self) { string in
                Text(string)
            }.padding()

            amountStack
            
            Button(Strings.buttonTitle, action: vm.convert)
                .frame(height: 44)
                .disabled(vm.isLoading)
        }
    }
    
    var amountStack: some View {
        HStack {
            Text("Convert")
            TextField("Enter amount", value: $vm.chosenAmount, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .padding()
            
            Text("to")
            
            Picker("To", selection: $vm.pickedCurrencyTo) {
                ForEach(vm.pickerData, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
        }
        .padding()
    }
}

extension ContentView {
    struct Strings {
        static let title = "Currency Converter"
        static let balancesTitle = "My Balances"
        static let buttonTitle = "Submit"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ContentViewModel(user: User()))
    }
}
