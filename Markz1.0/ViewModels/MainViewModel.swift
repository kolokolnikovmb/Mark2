import Foundation
import WebKit

class MainViewModel: NSObject, ObservableObject {
    @Published var currentURL: URL? = URL(string: "https://www.google.com")
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    @Published var progress: Double = 0.0
    @Published var isLoading: Bool = false
    
    private var webView: WKWebView?
    // Добавил метод наблюдения в класс MainViewModel:
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            DispatchQueue.main.async {
                self.progress = self.webView?.estimatedProgress ?? 0.0
            }
        }
    }
    
    func setup(webView: WKWebView) {
        self.webView = webView
        webView.navigationDelegate = self
    // В классе MainViewModel, обновил метод setup():
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
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
    
    func loadUrl(url: URL) {
        let request = URLRequest(url: url)
        webView?.load(request)
    }
    
    func goHome() {
        if let homeURL = URL(string: "https://www.google.com") {
            let request = URLRequest(url: homeURL)
            webView?.load(request)
        }
    }
}

extension MainViewModel: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            isLoading = true
        }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        currentURL = webView.url
        canGoBack = webView.canGoBack
        canGoForward = webView.canGoForward
        isLoading = false
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            isLoading = false
        }
}
