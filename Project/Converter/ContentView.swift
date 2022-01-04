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
            Text(vm.balancesTitle)
                .padding()
            
            List(vm.userBalances, id: \.self) { string in
                Text(string)
            }.padding()
            
            Text(vm.exchangeTitle)
                .padding()
            
            Button(vm.buttonTitle, action: vm.convert)
                .frame(height: 44)
                .disabled(vm.isLoading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ContentViewModel(user: User()))
    }
}
