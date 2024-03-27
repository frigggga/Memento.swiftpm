//
//  CreditVIew.swift
//  Memento
//
//  Created by Zhang on 2024/2/25.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        ZStack {
            
            Image.theme.background_color
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.white)
                .opacity(0.70)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black, lineWidth: 3)
                )

            Text("Thank you for playing this game!")
                .foregroundColor(Color.theme.themeColor)
                .font(.custom(.title, size: 30))

        }
        
    }
}

#Preview {
    CreditView()
}
