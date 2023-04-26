import WebKit
import SwiftUI

class WebViewSnapshot {
    func takeSnapshot(webView: WKWebView, completion: @escaping (UIImage?) -> Void) {
        let configuration = WKSnapshotConfiguration()
        configuration.rect = CGRect(origin: .zero, size: webView.scrollView.contentSize)

        webView.takeSnapshot(with: configuration) { image, error in
            if let error = error {
                print("Error taking snapshot: \(error)")
                completion(nil)
            } else {
                completion(image)
            }
        }
    }
}
