//
//  Markz1_0App.swift
//  Markz1.0
//
//  Created by Mikhail Kolokolnikov on 18.04.2023.
//

import SwiftUI

@main
struct Markz1_0App: App {
    @StateObject private var tabViewModel = TabViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                            TabView()
                                .environmentObject(tabViewModel)
                        }
        }
    }
}
