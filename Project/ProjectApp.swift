//
//  ProjectApp.swift
//  Project
//
//  Created by Artūrs Āre on 04/01/2022.
//

import SwiftUI

@main
struct ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: ContentViewModel())
        }
    }
}
