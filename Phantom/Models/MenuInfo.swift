//
//  MenuInfo.swift
//  Phantom
//
//  Created by Aayush Pokharel on 2023-05-10.
//

import Foundation

struct MenuInfo {
    let alpha: CGFloat
    let bounds: CGRect
    let ownerPID: Int
    let layer: Int
    let ownerName: String

    init?(dictionary: [String: Any]) {
        guard
            let alpha = dictionary["kCGWindowAlpha"] as? CGFloat,
            let boundsDict = dictionary["kCGWindowBounds"] as? [String: CGFloat],
            let bounds = CGRect(dictionaryRepresentation: boundsDict as CFDictionary),
            let ownerPID = dictionary["kCGWindowOwnerPID"] as? Int,
            let layer = dictionary["kCGWindowLayer"] as? Int,
            let ownerName = dictionary["kCGWindowOwnerName"] as? String
        else { return nil }

        self.alpha = alpha
        self.bounds = bounds
        self.ownerPID = ownerPID
        self.layer = layer
        self.ownerName = ownerName
    }
}
