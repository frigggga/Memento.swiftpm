

import SwiftUI

@available(iOS 16.4, *)
struct PrologueView: View {
    @State private var plotComplete = false
    @Environment(\.dismiss) private var dismiss
    @State private var dismissThis = false
    @State private var isPresented = false
    @State private var readyForIllumination = false
    @EnvironmentObject var dataModel : DataModel
    
    var body: some View {
        VStack {
            HStack(){
                LevelIconView(imageName: "Prologue").frame(width: 100, height: 100)
                Spacer().frame(width: 20)
                Text("Prologue")
                    .foregroundColor(Color.theme.brightColor)
                    .font(.custom(.title, size: 30))
                
            }
            Spacer().frame(height: 40)
            PlotView(dialogues: Plot().prologue, plotComplete: $plotComplete, readyForIllumination: $readyForIllumination).frame(width: UIScreen.getScreenWidth() * 0.8, height: UIScreen.getScreenHeight() * 0.4)
                .onChange(of: plotComplete) { newValue in
                    if newValue {
                        DispatchQueue.main.async {
                            self.dismissThis = true
                        }
                    }
                }
            Spacer().frame(height: 10)
            Button {
                dataModel.index += 1
                GameView()
                    .frame(width: UIScreen.getScreenWidth(), height: UIScreen.getScreenHeight())
                    .environmentObject(dataModel)
    
            } label: {
                Text("Dismiss")
            }.disabled(!dismissThis)
            .buttonStyle(CustomButtonStyle())
            
            
        }.background(Image.theme.background_black)

    }
}
        

