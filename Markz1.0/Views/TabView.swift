import SwiftUI

struct TabView: View {
    @EnvironmentObject var tabViewModel: TabViewModel

    var body: some View {
        HStack {
            ForEach(0..<tabViewModel.tabs.count, id: \.self) { index in
                Button(action: {
                    tabViewModel.selectedTabIndex = index
                }) {
                    Text("Tab \(index + 1)")
                        .fontWeight(index == tabViewModel.selectedTabIndex ? .bold : .regular)
                }
                .padding(.horizontal)
            }

            Spacer()

            Button(action: {
                tabViewModel.addTab()
            }) {
                Image(systemName: "plus")
            }
            .padding(.horizontal)
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView().environmentObject(TabViewModel())
    }
}
