import SwiftUI


@available(iOS 16.4, *)
struct ContentView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        ZStack {
            Image.theme.background_black
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            GameView().environmentObject(dataModel)
        }
        .onAppear{
            play("toEdinburgh")
        }
    }
}
