//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by Jacob Yoo on 6/3/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.5 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut : .none, value: animate)
            .foregroundStyle(Color.theme.accent)
    }
}
