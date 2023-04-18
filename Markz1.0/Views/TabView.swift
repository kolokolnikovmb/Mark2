import SwiftUI

struct TabView: View {
    @EnvironmentObject var tabViewModel: TabViewModel

    var body: some View {
        VStack {
            TabBarView()

            ForEach(0..<tabViewModel.tabs.count, id: \.self) { index in
                if index == tabViewModel.selectedTabIndex {
                    MainView()
                        .environmentObject(tabViewModel.tabs[index])
                }
            }
        }
    }
}

struct TabBarView: View {
    @EnvironmentObject var tabViewModel: TabViewModel

    var body: some View {
        HStack {
            ForEach(0..<tabViewModel.tabs.count, id: \.self) { index in
                VStack {
                    Button(action: {
                        tabViewModel.selectedTabIndex = index
                    }) {
                        Text(tabViewModel.tabs[index].currentURL?.host ?? "Tab \(index + 1)")
                    }
                    .background(index == tabViewModel.selectedTabIndex ? Color.blue : Color.clear)
                    .cornerRadius(8)

                    if tabViewModel.tabs.count > 1 {
                        Button(action: {
                            tabViewModel.closeTab(at: index)
                        }) {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                        .offset(x: -10, y: -5)
                    }
                }
            }
            Button(action: {
                tabViewModel.addTab()
            }) {
                Image(systemName: "plus")
            }
            .padding(.leading)
        }
        .padding()
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
