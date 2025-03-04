//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Jacob Yoo on 6/3/24.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
