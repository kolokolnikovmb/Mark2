import SwiftUI

struct AddressBarView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var inputURL: String = ""

    var body: some View {
        HStack {
            TextField("Введите адрес", text: $inputURL, onCommit: {
                if let preparedUrl = prepareUrl(input: inputURL) {
                                    mainViewModel.currentURL = preparedUrl
                                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .autocapitalization(.none)
            .disableAutocorrection(true)

            Button(action: {
                mainViewModel.currentURL = URL(string: inputURL)
            }) {
                Image(systemName: "arrow.right")
            }
            .padding(.trailing)
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
