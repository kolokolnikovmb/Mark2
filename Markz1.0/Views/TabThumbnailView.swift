import SwiftUI
import WebKit

struct TabThumbnailView: View {
    var tab: Tab
    var closeAction: () -> Void
    @ObservedObject private var webViewSnapshot = WebViewSnapshot()
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                GeometryReader { geometry in
                    if let image = webViewSnapshot.image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    } else {
                        Color.gray
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        webViewSnapshot.takeSnapshot(webView: tab.webView)
                    }
                }
                
                Button(action: closeAction) {
                    Image(systemName: "xmark")
                        .padding(4)
                        .background(Color.gray.opacity(0.7))
                        .clipShape(Circle())
                }
                .padding([.top, .trailing], 4)
            }
            
            Text(tab.title)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 4)
        }
        .frame(width: 150, height: 200)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(8)
    }
}
