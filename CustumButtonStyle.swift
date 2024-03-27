//
//  CustumButtonStyle.swift
//  Memento
//
//  Created by Zhang on 2024/2/25.
//

import SwiftUI
struct CustomButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.theme.backgroundColor)
            .foregroundColor(Color.theme.accentColor)
            .cornerRadius(10)
            .saturation(isEnabled ? 1 : 0)
    }
}
