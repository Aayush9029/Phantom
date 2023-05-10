//
//  PhantomApp.swift
//  Phantom
//
//  Created by Aayush Pokharel on 2023-05-10.
//

import SwiftUI

@main
struct PhantomApp: App {
    @StateObject var menuController: MenuBarController = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)

        MenuBarExtra {} label: {
            Label("YO", systemImage: "chevron.up")
        }
    }
}
