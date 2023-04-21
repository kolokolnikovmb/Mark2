import SwiftUI
import WebKit

struct TabThumbnailView: View {
    var tab: Tab
    var closeAction: () -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                GeometryReader { geometry in // добавлено
                    tab.webView
                        .frame(width: geometry.size.width, height: geometry.size.height) // изменено
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
