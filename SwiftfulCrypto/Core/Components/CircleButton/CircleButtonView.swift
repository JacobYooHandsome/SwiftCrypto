//
//  CircleButtonView.swift
//  SwiftfulCrypto
//
//  Created by Jacob Yoo on 6/3/24.
//

import SwiftUI

struct CircleButtonView: View {
    
    
    let iconName: String
    var width : CGFloat = 50
    var height : CGFloat = 50
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: width, height: height)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0
            )
    }
}

#Preview {
    Group {
        CircleButtonView(iconName: "info")
        CircleButtonView(iconName: "plus")
            .colorScheme(.dark)
    }
}


