
import SwiftUI

@available(iOS 16.4, *)
struct IntroductionView: View {
    @State private var plotComplete = false
    @State private var readyForIllumination = false
    @Environment(\.dismiss) private var dismiss
    @State var isPresented: Bool = false
    
    var body: some View {
        
        VStack {
            Text("Memento")
                .foregroundColor(Color.theme.brightColor)
                .font(.custom(.name, size: 50))
            Spacer().frame(height: 40)
            PlotView(dialogues: Plot().introduction, plotComplete: $plotComplete, readyForIllumination: $readyForIllumination)/*.frame(width: UIScreen.getScreenWidth() * 0.8, height: UIScreen.getScreenHeight() * 0.4)*/
            Spacer().frame(height: 40)
            Button("Yes I'm ready") {
                    isPresented.toggle()
                }
                .fullScreenCover(isPresented: $isPresented, content: PrologueView.init)
                .buttonStyle(CustomButtonStyle())
            
            
        }
        .controlSize(.regular)
        .buttonStyle(.bordered)
        .background(Image.theme.background_color)
    }
        
}

