//
//  Device+Extension.swift
//  ASFoundation
//
//  Created by jesse on 2019/8/31.
//  Copyright © 2019 jesse. All rights reserved.
//

import Foundation

class DeviceContext {
    
    static func bundleVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
}
