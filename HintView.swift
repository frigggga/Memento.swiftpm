

import SwiftUI

struct HintView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var imageName: String
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)

            Button {
                dismiss()
            } label: {
                Text("dismiss")
            }.buttonStyle(CustomButtonStyle())
            
        }
    }
}

#Preview {
    HintView(imageName: "hint1")
}
