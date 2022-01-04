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
            
            Button(vm.buttonTitle, action: vm.convert)
                .frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ContentViewModel(user: User()))
    }
}
