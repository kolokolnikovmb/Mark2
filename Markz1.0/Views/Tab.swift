import Foundation
import WebKit
import SwiftUI

class Tab: Identifiable, ObservableObject {
    let id: UUID
    let webView: WKWebView
    @Published var title: String

    init(id: UUID, webView: WKWebView, title: String) {
        self.id = id
        self.webView = webView
        self.title = title
    }
}
