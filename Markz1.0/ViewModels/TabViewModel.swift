import Foundation
import Combine
import WebKit

class TabViewModel: NSObject, ObservableObject {
    @Published var tabs: [Tab] = []
    @Published var currentTab: Tab?

    override init() {
        super.init()
        addTab()
    }

    func addTab() {
        let webView = WKWebView()
        webView.navigationDelegate = self
        let newTab = Tab(id: UUID(), webView: webView, title: "New Tab")
        tabs.append(newTab)
        currentTab = newTab
    }

    func removeTab(_ tab: Tab) {
        if let index = tabs.firstIndex(where: { $0.id == tab.id }), tabs.count > 1 {
            tabs.remove(at: index)
            if let lastTab = tabs.last {
                currentTab = lastTab
            }
        }
    }
    
    func updateTitle(for urlString: String, title: String) {
        if let index = tabs.firstIndex(where: { $0.webView.url?.absoluteString == urlString }) {
            tabs[index].title = title
        }
    }

    func setCurrentTab(at index: Int) {
        currentTab = tabs[index]
    }
}

extension TabViewModel: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let title = webView.title, let urlString = webView.url?.absoluteString {
            updateTitle(for: urlString, title: title)
        }
    }
}
