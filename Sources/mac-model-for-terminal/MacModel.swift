//
//  MacModel.swift
//
//
//  Created by Carlos Álvaro on 10/6/23.
//

import Foundation
import IOKit

public class MacModel {
    private var macModel: String?

    func getMacModel() -> String {
        if let macModel {
            return macModel
        }

        let service = IOServiceGetMatchingService(kIOMainPortDefault,
                                                  IOServiceMatching("IOPlatformExpertDevice"))

        let model = IORegistryEntryCreateCFProperty(service, "model" as CFString,
                                                    kCFAllocatorDefault, 0).takeRetainedValue()

        if let modelData = model as? Data {
            if let modelIdentifierCString = String(data: modelData, encoding: .utf8)?.cString(using: .utf8) {
                macModel = String(cString: modelIdentifierCString)
            }
        }

        IOObjectRelease(service)
        return macModel ?? "Unknown"
    }
}
