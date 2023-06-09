import SwiftUI

struct ControlButtonsView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var tabViewModel: TabViewModel
    
    @State private var isTabViewPresented = false
    
    var body: some View {
        HStack {
            Button(action: {
                mainViewModel.goBack()
            }) {
                Image(systemName: "chevron.left")
                    .disabled(!mainViewModel.canGoBack)
                    .buttonStyle(PlainButtonStyle())
            }

            Button(action: {
                mainViewModel.goForward()
            }) {
                Image(systemName: "chevron.right")
                    .disabled(!mainViewModel.canGoForward)
                    .buttonStyle(PlainButtonStyle())
            }

            Button(action: {
                mainViewModel.reload()
            }) {
                Image(systemName: "arrow.clockwise")
                    .buttonStyle(PlainButtonStyle())
            }

            Button(action: {
                mainViewModel.goHome()
            }) {
                Image(systemName: "house")
                    .buttonStyle(PlainButtonStyle())
            }
            
            Button(action: {
                            tabViewModel.addTab()
                        }) {
                            Image(systemName: "plus")
                                .buttonStyle(PlainButtonStyle())
                        }
            
            Button(action: {
                            isTabViewPresented = true
                        }) {
                            Image(systemName: "square.on.square")
                                .buttonStyle(PlainButtonStyle())
                        }
                        .sheet(isPresented: $isTabViewPresented) {
                            TabView()
                                .environmentObject(tabViewModel)
                                .environmentObject(mainViewModel)
                        }
            
        }
        .padding()
    }
}
