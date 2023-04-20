import Foundation
import WebKit

class MainViewModel: NSObject, ObservableObject {
    @Published var currentURL: URL? = URL(string: "https://www.google.com")
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    
    private var webView: WKWebView?
    
    func setup(webView: WKWebView) {
        self.webView = webView
        webView.navigationDelegate = self
    }
    
    func goBack() {
        webView?.goBack()
    }
    
    func goForward() {
        webView?.goForward()
    }
    
    func reload() {
        webView?.reload()
    }
    
    func goHome() {
        if let homeURL = URL(string: "https://www.google.com") {
            let request = URLRequest(url: homeURL)
            webView?.load(request)
        }
    }
}

extension MainViewModel: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        currentURL = webView.url
        canGoBack = webView.canGoBack
        canGoForward = webView.canGoForward
    }
}
