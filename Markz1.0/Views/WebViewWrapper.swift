import SwiftUI
import WebKit

struct WebViewWrapper: UIViewRepresentable {
    @Binding var url: URL?
    @EnvironmentObject var mainViewModel: MainViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        mainViewModel.setup(webView: webView)
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        if let url = url, webView.url != url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewWrapper

        init(_ parent: WebViewWrapper) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if let title = webView.title, let url = webView.url {
                parent.mainViewModel.updateTitle(for: url.absoluteString, title: title)
            }
        }
    } // Закрывающая фигурная скобка для класса Coordinator
} // Закрывающая фигурная скобка для структуры WebViewWrapper
