import SwiftUI

struct AddressBarView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var text: String = ""

    var body: some View {
        HStack {
            TextField("Enter URL or search query...", text: $text, onCommit: {
                if let url = prepareUrl(input: text) {
                    mainViewModel.loadUrl(url: url)
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .autocapitalization(.none)
            .disableAutocorrection(true)

            Button(action: {
                if let url = prepareUrl(input: text) {
                        mainViewModel.loadUrl(url: url)
                    }
            }) {
                Image(systemName: "arrow.right")
            }
            .padding(.trailing)
        }
    }
    
    func onCommit() {
            if let url = prepareUrl(input: text) {
                mainViewModel.loadUrl(url: url)
            }
        }
    
    func prepareUrl(input: String) -> URL? {
            if let url = URL(string: input), url.scheme != nil {
                return url
            } else if let url = URL(string: "https://\(input)") {
                return url
            } else if let url = URL(string: "http://\(input)") {
                return url
            } else if let url = URL(string: "http://www.\(input)") {
                return url
            } else if let url = URL(string: "https://www.\(input)") {
                return url
            }
            return nil
    }
}

struct AddressBarView_Previews: PreviewProvider {
    static var previews: some View {
        AddressBarView().environmentObject(MainViewModel())
    }
}
