import SwiftUI

struct MainView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @StateObject private var mainViewModel: MainViewModel

    init(tabViewModel: TabViewModel) {
        _mainViewModel = StateObject(wrappedValue: MainViewModel(tabViewModel: tabViewModel))
    }

    var body: some View {
        NavigationView {
            VStack {
                // WebViewWrapper для WKWebView
                WebViewWrapper(url: $mainViewModel.currentURL)
                    .edgesIgnoringSafeArea(.bottom)
                    .environmentObject(mainViewModel)
                
                // Адресная строка
                AddressBarView()
                    .environmentObject(mainViewModel)

                // Базовые кнопки управления
                ControlButtonsView()
                    .environmentObject(mainViewModel)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom))
        }
    }
}
