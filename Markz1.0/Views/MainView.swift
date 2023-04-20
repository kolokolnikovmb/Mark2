import SwiftUI

struct MainView: View {
    @StateObject private var mainViewModel = MainViewModel()
    @StateObject private var tabViewModel = TabViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Здесь добавьте TabView
                
              /*  TabView()
                    .environmentObject(tabViewModel)
              */
                
                // WebViewWrapper для WKWebView
                WebViewWrapper(url: $mainViewModel.currentURL)
                    .edgesIgnoringSafeArea(.bottom)
                
                // Адресная строка
                AddressBarView()
                    .environmentObject(mainViewModel)

                // Базовые кнопки управления
                ControlButtonsView()
                    .environmentObject(mainViewModel)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom))
            //.navigationTitle("Mark2 Browser")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
