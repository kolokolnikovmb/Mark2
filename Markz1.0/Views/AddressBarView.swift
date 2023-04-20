import SwiftUI

struct AddressBarView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var inputURL: String = ""

    var body: some View {
        HStack {
            TextField("Введите адрес", text: $inputURL, onCommit: {
                mainViewModel.currentURL = URL(string: inputURL)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            Button(action: {
                mainViewModel.currentURL = URL(string: inputURL)
            }) {
                Image(systemName: "arrow.right")
            }
            .padding(.trailing)
        }
    }
}

struct AddressBarView_Previews: PreviewProvider {
    static var previews: some View {
        AddressBarView().environmentObject(MainViewModel())
    }
}
