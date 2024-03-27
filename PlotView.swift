

import SwiftUI


struct PlotView: View {
    
    let dialogues: [Dialogue]
    @State var text: String = ""
    @State var dialoguePosition: Int = 1
    @Binding var plotComplete: Bool
    @Binding var readyForIllumination: Bool
    @State var isAnimating: Bool = false
    
    
    var body: some View {
        ZStack(alignment: .bottom){
                    VStack(){
                        Spacer()
                            .frame(height: 5)
                        HStack(spacing: 5){
                            
                            VStack(){
                                if dialogues[dialoguePosition].character == 1 {
                                    Image("natasha")
                                        .resizable()
                                        .frame(width: 110, height: 110)
                                        .scaledToFit()
                                    Text("Natasha")
                                        .foregroundColor(Color.theme.themeColor)
                                        .font(.custom(.name, size: 25))
                                }
                                if dialogues[dialoguePosition].character == 2 {
                                    Image("magician")
                                        .resizable()
                                        .frame(width: 110, height: 110)
                                        .scaledToFit()
                                    Text("Maeve")
                                        .foregroundColor(Color.theme.themeColor)
                                        .font(.custom(.name, size: 25))
                                }
                            }
                            
                            Spacer()
                                .frame(width: 5)
                            
                            ZStack(alignment: .topLeading){
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(Color.black)
                                    .opacity(0.70)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.white, lineWidth: 3)
                                    )
                                Text(text)
                                    .font(.custom(.name, size: 18))
                                    .foregroundColor(Color.theme.brightColor)
                                    .padding(16)
                            }
                            .frame(height: 140)
                        
                    }
                    Spacer()
                    .frame(height: 20)
                }.padding(.horizontal, 16)
        }.onTapGesture {
            moveToNextDialogue()
        }
        .ignoresSafeArea()
        .onAppear{
            typeWriter()
        }
                
    }
                              
    
    func typeWriter(at position: Int = 0) {
            isAnimating = true
            if position == 0 {
                text = ""
            }
        if position < dialogues[dialoguePosition].text.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.015) {
                    let aryChar = Array(dialogues[dialoguePosition].text)
                    text.append(aryChar[position])
                    typeWriter(at: position + 1)
                }
            } // waiting the text to finish
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isAnimating = false
            }
        }
    
    func moveToNextDialogue(){
        if !isAnimating && !plotComplete {
            typeWriter()
            if dialogues[dialoguePosition].contains(word: "Lumina") {
                readyForIllumination = true
            }
            dialoguePosition += 1
            if dialoguePosition == dialogues.count {
                plotComplete = true
                dialoguePosition = 0
            }
        }
    }
}




