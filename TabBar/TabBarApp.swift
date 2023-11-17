//
//  TabBarApp.swift
//  TabBar
//
//  Created by Yusuf Can Sağlam on 17.11.2023.
//

import SwiftUI

@main
struct TabBarApp: App {
    // selectedTab'i tanımla ve @State olarak işaretle
    @State private var selectedTab: String = "Home"

    var body: some Scene {
        WindowGroup {
            // TabBar2DemoView'e selectedTab'i geçir
            ContentView(selectedTab: $selectedTab)
        }
    }
}

