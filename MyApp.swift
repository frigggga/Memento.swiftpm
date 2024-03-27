import SwiftUI

@available(iOS 16.4, *)
@main
struct MyApp: App {
    
    @StateObject private var dataModel = DataModel()
    
    init() {
            CustomFonts.register()
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dataModel)
        }
    }
}
