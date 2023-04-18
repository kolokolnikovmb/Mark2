import Foundation
import Combine

class TabViewModel: ObservableObject {
    @Published var tabs: [MainViewModel] = [MainViewModel()]
    @Published var selectedTabIndex = 0

    func addTab() {
        let newTab = MainViewModel()
        tabs.append(newTab)
        selectedTabIndex = tabs.count - 1
    }

    func closeTab(at index: Int) {
        tabs.remove(at: index)
        if selectedTabIndex >= index {
            selectedTabIndex = max(0, selectedTabIndex - 1)
        }
    }
}
