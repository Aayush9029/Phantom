//
//  StatusBarVM.swift
//  Phantom
//
//  Created by Aayush Pokharel on 2023-05-10.
//

import AppKit
import Combine

@MainActor
final class StatusBarVM: ObservableObject {
    @Published var menuApps: [NSRunningApplication] = []

    private static let systemApps = Set([
        "SystemUIServer",
        "Control Center",
        "Window Server",
        "Phantom",
    ])

    init() {
        refreshApplications()
    }

    func contentAppeared() {
        refreshApplications()
    }

    var menuList: [MenuInfo] {
        let options = CGWindowListOption(arrayLiteral: .excludeDesktopElements, .optionOnScreenOnly)
        guard let infoList = CGWindowListCopyWindowInfo(options, CGWindowID(0)) as? [[String: Any]] else {
            return []
        }

        return infoList
            .compactMap(MenuInfo.init(dictionary:))
            .filter { !Self.systemApps.contains($0.ownerName) && $0.bounds.origin.y == 0 }
    }

    private func refreshApplications() {
        menuApps = menuList.map {
            NSRunningApplication(processIdentifier: pid_t($0.ownerPID)) ?? NSRunningApplication()
        }
    }
}
