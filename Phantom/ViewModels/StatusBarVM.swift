//
//  StatusBarVM.swift
//  Phantom
//
//  Created by Aayush Pokharel on 2023-05-10.
//

import AppKit
import SwiftUI

class StatusBarVM: ObservableObject {
    @Published var menuApps: [NSRunningApplication] = []

    init() {
        refreshApplications()
    }

    var menuList: [MenuInfo] {
        let systemApps = ["SystemUIServer", "Control Center", "Window Server", "Phantom"]
        let options = CGWindowListOption(arrayLiteral: .excludeDesktopElements, .optionOnScreenOnly)
        guard let infoList = CGWindowListCopyWindowInfo(options, CGWindowID(0)) as? [[String: Any]]
        else { return [] }
        let systemExcluded = infoList.filter { !systemApps.contains($0["kCGWindowOwnerName"] as? String ?? "") }
        let nonMenuExcluded = systemExcluded.filter {
            let boundsDict = $0[kCGWindowBounds as String] as! CFDictionary
            if let bounds = CGRect(dictionaryRepresentation: boundsDict), bounds.origin.y == 0 { return true }
            return false
        }
        return nonMenuExcluded.map { MenuInfo(dictionary: $0)! }
    }

    func refreshApplications() {
        menuApps = menuList.map {
            NSRunningApplication(processIdentifier: pid_t($0.ownerPID)) ?? NSRunningApplication()
        }
    }
}
