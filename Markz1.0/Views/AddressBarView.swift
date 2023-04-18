import SwiftUI

struct AddressBarView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var inputURL: String = ""

    var body: some View {
        HStack {
            TextField("Введите адрес", text: $inputURL, onCommit: {
                if let url = URL(string: inputURL) {
                    mainViewModel.loadUrl(url: url)
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.webSearch)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(.trailing)

            Button(action: {
                mainViewModel.reload()
            }) {
                Image(systemName: "arrow.clockwise")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(.gray)
            .padding(.leading, -8)
        }
    }
}
