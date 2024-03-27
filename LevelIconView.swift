

import SwiftUI

struct LevelIconView: View {
    let imageName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.black)
                .opacity(0.70)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white, lineWidth: 3)
                )
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
        }
    }

}

#Preview {
    LevelIconView(imageName: "Prologue")
}
