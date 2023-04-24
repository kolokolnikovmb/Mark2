import SwiftUI

@main
struct Markz1_0App: App {
    @StateObject private var tabViewModel = TabViewModel()

    var body: some Scene {
        WindowGroup {
            MainView(tabViewModel: tabViewModel)
                .environmentObject(tabViewModel)
        }
    }
}
