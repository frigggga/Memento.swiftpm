

import SwiftUI

struct LevelCompleteView: View {
    var detailIndex: Int
    var plot: [Dialogue]
    
    @State private var plotComplete = false
    @Environment(\.dismiss) private var dismiss
    @State private var dismissThis = false
    @State private var readyForIllumination = false
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(width: 20)
            if detailIndex == 1 {
                HStack {
                    LevelIconView(imageName: "HotPot").frame(width: 100, height: 100)
                    Spacer().frame(width: 20)
                    Text("Memento: HotPot")
                        .foregroundColor(Color.theme.themeColor)
                        .font(.custom(.title, size: 30))
                }
                Image("HotPot_color")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()
            } else if detailIndex == 2 {
                HStack {
                    LevelIconView(imageName: "Camera").frame(width: 100, height: 100)
                    Spacer().frame(width: 20)
                    Text("Memento: Camera").font(.title)
                }
                Image("Camera_color")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()
            } else {
                HStack {
                    LevelIconView(imageName: "Medal").frame(width: 100, height: 100)
                    Spacer().frame(width: 20)
                    Text("Memento: Medal").font(.title)
                }
                Image("Medal_color")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()
            }
            Spacer().frame(height: 10)
            VStack {
                PlotView(dialogues: plot, plotComplete: $plotComplete, readyForIllumination: $readyForIllumination).frame(width: UIScreen.getScreenWidth() * 0.8, height: UIScreen.getScreenHeight() * 0.4)
                    .onChange(of: plotComplete) { newValue in
                        if newValue {
                            DispatchQueue.main.async {
                                self.dismissThis = true
                            }
                        }
                    }
                Button {
                    self.dismiss()
                } label: {
                    Text("plot complete")
                }.disabled(!dismissThis)
                
            }
        }.background(Color.clear)
    }
}

#Preview {
    LevelCompleteView(detailIndex: 1, plot: Plot().HotPot)
}
