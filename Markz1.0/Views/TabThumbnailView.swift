import SwiftUI
import WebKit

struct TabThumbnailView: View {
    @ObservedObject var tab: Tab
    var closeAction: () -> Void
    var title: String //Измените структуру TabThumbnailView, чтобы использовать Binding к переменной title
    @State private var snapshot: UIImage?
    
    private let webViewSnapshot = WebViewSnapshot()
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                GeometryReader { geometry in
                    if let snapshot = snapshot {
                        Image(uiImage: snapshot)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                    } else {
                        Color.gray
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
                .onAppear {
                    webViewSnapshot.takeSnapshot(webView: tab.webView) { image in
                        snapshot = image
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
