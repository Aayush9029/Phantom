//
//  ContentView.swift
//  Phantom
//
//  Created by Aayush Pokharel on 2023-05-10.
//

import SwiftUI

struct ContentView: View {
    @StateObject var statusVM: StatusBarVM = .init()
    let columns: [GridItem] = [.init(.adaptive(minimum: 64, maximum: 256))]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(statusVM.menuApps, id: \.self) { app in
                    SingleMenuApp(app: app)
                }
            }
            Spacer()
        }
        .padding()

        .onAppear {
            print(statusVM.menuApps)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().frame(width: 256)
    }
}

struct SingleMenuApp: View {
    let app: NSRunningApplication

    var body: some View {
        VStack {
            Image(nsImage:
                app.icon ?? NSImage(
                    symbolName: "doc.badge.gearshape.fill",
                    variableValue: 1.0
                )!
            )
            .resizable()
            .scaledToFill()
            .shadow(color: .black.opacity(0.125), radius: 2, x: 2, y: 2)
            Text(app.localizedName ?? "Unknown")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
        .padding(6)
        .background(.gray.opacity(0.125))
        .cornerRadius(16)
    }
}
