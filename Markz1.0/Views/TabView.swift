import SwiftUI

struct TabView: View {
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var mainViewModel: MainViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 16)], spacing: 16) {
                    ForEach(tabViewModel.tabs) { tab in
                        // Изменено: использование TabThumbnailView
                        TabThumbnailView(tab: tab, closeAction: {
                            tabViewModel.removeTab(tab)
                        })
                        .onTapGesture {
                            if let index = tabViewModel.tabs.firstIndex(where: { $0.id == tab.id }) {
                                tabViewModel.setCurrentTab(at: index)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Tabs")
            Button(action: {
                tabViewModel.addTab()
            }) {
                HStack {
                    Image(systemName: "plus")
                    Text("New Tab")
                }
            }
            .padding()
        }
    }
}
