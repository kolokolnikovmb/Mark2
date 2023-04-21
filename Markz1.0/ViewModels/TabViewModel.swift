import Foundation
import Combine
import WebKit // Добавлено

struct Tab: Identifiable {
    let id: UUID
    let webView: WKWebView
    var title: String
}

class TabViewModel: ObservableObject {
    @Published var tabs: [Tab] = []
    @Published var currentTab: Tab?

    init() {
        addTab()
    }

    func addTab() {
        let webView = WKWebView() // исправлено
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
        if let index = tabs.firstIndex(where: { $0.webView.url?.absoluteString == urlString }) { // исправлено
            tabs[index].title = title
            // saveTabs() удалено, так как функция не реализована
        }
    }

    func setCurrentTab(at index: Int) {
        currentTab = tabs[index]
    }
}
