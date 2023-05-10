//
//  PhantomApp.swift
//  Phantom
//
//  Created by Aayush Pokharel on 2023-05-10.
//

import SwiftUI

@main
struct PhantomApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
        }
        .windowStyle(.hiddenTitleBar)

        MenuBarExtra {
            ContentView()
        } label: {
            Label("YO", systemImage: "chevron.up")
        }
        .menuBarExtraStyle(.window)
    }
}
