import SwiftUI

struct ControlButtonsView: View {
    @EnvironmentObject var mainViewModel: MainViewModel

    var body: some View {
        VStack {
            //Spacer()
            HStack {
                Button(action: {
                    mainViewModel.goBack()
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .disabled(!mainViewModel.canGoBack)
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.gray)
                .padding(.leading, 30)

                
                Button(action: {
                    mainViewModel.goForward()
                }) {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .disabled(!mainViewModel.canGoForward)
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.gray)
                .padding(.leading, 30)
                
                // Spacer()
                
                Button(action: {
                    mainViewModel.goHome()
                }) {
                    Image(systemName: "house")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.gray)
                .padding(.leading, 70)
                //.position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                Spacer()
            }
            .padding(.bottom, 30)
        }
    }
}
