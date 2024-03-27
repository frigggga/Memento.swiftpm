

import SwiftUI

@available(iOS 16.4, *)
struct GameView: View {
    @EnvironmentObject var dataModel: DataModel
    @State private var showHint = false
    @State private var showSheet = false
        
    
    var body: some View {
        if dataModel.index == 0 {
            IntroductionView()
                .background(Color.clear)
        } else if dataModel.index > 3 {
            EpilogueView()
                .background(Color.clear)
        } else {
            VStack(alignment: .center) {

                Text("Solve the puzzle! ")
                    .foregroundColor(Color.theme.brightColor)
                    .font(.custom(.title, size: 30))
                
                CollectionViewWrapper()
                    .frame(width: 500, height: 500)
                    .background(.white)
                
                HStack {
                    
                    Button {
                        self.showHint = true
                    } label: {
                        Text("Hint")
                    }
                    .sheet(isPresented: $showHint) {
                        VStack {
                            if dataModel.index == 1 {
                                HintView(imageName: "hint1").frame(width: 500, height: 500)
                            } else if dataModel.index == 2 {
                                HintView(imageName: "hint2").frame(width: 500, height: 500)
                            } else if dataModel.index == 3 {
                                HintView(imageName: "hint3").frame(width: 500, height: 500)
                            }
                        }.presentationDetents([ .medium, .large])
                            .presentationBackground(.thinMaterial)
                            .presentationCornerRadius(100)
                        
                    }.buttonStyle(CustomButtonStyle())
                    
                    Spacer().frame(width: 30)
                    
                        Button("Complete") {
                            dataModel.index += 1
                            DispatchQueue.main.async {
                                self.showSheet = true
                            }
                        } .sheet(isPresented: $showSheet) {
                            VStack {
                                if dataModel.index == 1 {
                                    LevelCompleteView(detailIndex: dataModel.index - 1, plot: Plot().HotPot)
                                } else if dataModel.index == 2 {
                                    LevelCompleteView(detailIndex: dataModel.index - 1, plot: Plot().Camera)
                                    
                                } else {
                                    LevelCompleteView(detailIndex: dataModel.index - 1, plot: Plot().Medal)
                                }
                            }.presentationDetents([ .medium, .large])
                                .presentationBackground(.thinMaterial)
                                .presentationCornerRadius(100)
                                                    
                            
                        }
                        
                        .buttonStyle(CustomButtonStyle())
                    
                }
                
                
            }.background(Color.clear)
            
        }
        
    }
    
}



