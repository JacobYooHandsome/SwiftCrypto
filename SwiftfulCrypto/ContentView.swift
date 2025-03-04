//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by Jacob Yoo on 6/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
            VStack {
                Text("Accent Color")
                    .foregroundStyle(Color.theme.accent)
                Text("Secondary Text Color")
                    .foregroundStyle(Color.theme.secondaryText)
                Text("Red Color")
                    .foregroundStyle(Color.theme.red)
                Text("Green Color")
                    .foregroundStyle(Color.theme.green)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
