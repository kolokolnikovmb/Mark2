import SwiftUI

struct MainView: View {
    @StateObject private var mainViewModel = MainViewModel()

    var body: some View {
        NavigationView {
            VStack {
                 // WebViewWrapper для WKWebView
                WebViewWrapper(url: $mainViewModel.currentURL)
                    .edgesIgnoringSafeArea(.bottom)


                    // Адресная строка
                    AddressBarView()
                        .environmentObject(mainViewModel)
                        .padding(.horizontal)
                
                // Кнопки управления внизу экрана, потом добавим сюда остальные элементы управления
                HStack {
                    // Базовые кнопки управления
                    ControlButtonsView()
                        .environmentObject(mainViewModel)
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.1), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom))
                        .edgesIgnoringSafeArea(.bottom)
                        
            //.navigationTitle("Markz")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
