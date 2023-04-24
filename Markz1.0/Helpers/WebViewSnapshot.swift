import SwiftUI
import WebKit

class WebViewSnapshot: ObservableObject {
    @Published var image: UIImage?

    func takeSnapshot(webView: WKWebView) {
        let configuration = WKSnapshotConfiguration()
        webView.takeSnapshot(with: configuration) { image, error in
            if let error = error {
                print("Error taking snapshot: \(error.localizedDescription)")
            } else {
                self.image = image
            }
        }
    }
}
