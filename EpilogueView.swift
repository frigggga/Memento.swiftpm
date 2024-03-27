

import SwiftUI

struct EpilogueView: View {
    @State private var plotComplete = false
    @State private var readyForIllumination = false
    @Environment(\.dismiss) private var dismiss
    @State private var dismissThis = false
    @State private var showBackground = false
    @State private var isPresented = false
    
    
    var body: some View {
        ZStack {
            if showBackground {
                Image.theme.background_color 
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .scaleEffect(showBackground ? 1.0 : 0.0) // Start from scale 0 to 1
                    .animation(.easeOut(duration: 1.5), value: showBackground) // Animate the scale effect
            }
            VStack {
                HStack {
                    LevelIconView(imageName: "Epilogue").frame(width: 100, height: 100)
                    Spacer().frame(width: 20)
                    Text("Memento: Epilogue")
                        .foregroundColor(Color.theme.brightColor)
                        .font(.custom(.title, size: 30))
                }
                Spacer().frame(height:  10)
                PlotView(dialogues: Plot().epilogue, plotComplete: $plotComplete, readyForIllumination: $readyForIllumination)
                    .frame(width: UIScreen.getScreenWidth() * 0.8, height: UIScreen.getScreenHeight() * 0.4)
                
                // wait for plot to finish
                    .onChange(of: plotComplete) { newValue in
                        if newValue {
                            dismissThis = true
                        }
                    }
                
                //animation for illumination
                    .onChange(of: readyForIllumination) { newValue in
                        if newValue {
                            withAnimation {
                                showBackground.toggle()
                            }
                        }
                    }
                Spacer().frame(height: 10)
                Button("Next") {
                    isPresented.toggle()
                }
                .fullScreenCover(isPresented: $isPresented, content: CreditView.init)
                .buttonStyle(CustomButtonStyle())
                .disabled(!dismissThis)
            }.background(Image.theme.background_black //
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }
    }
    
}
        


#Preview {
    EpilogueView()
}
