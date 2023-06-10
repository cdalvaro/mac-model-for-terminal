//
//  File.swift
//  
//
//  Created by Carlos Álvaro on 10/6/23.
//

import Foundation
import IOKit

public class MacModel {
    
    private var macModel: String?
    
    func getMacModel() -> String {
        if let macModel = macModel {
            return macModel
        }
        
        let service = IOServiceGetMatchingService(kIOMainPortDefault,
                                                  IOServiceMatching("IOPlatformExpertDevice"))

        if let modelData = IORegistryEntryCreateCFProperty(service, "model" as CFString, kCFAllocatorDefault, 0).takeRetainedValue() as? Data {
            if let modelIdentifierCString = String(data: modelData, encoding: .utf8)?.cString(using: .utf8) {
                macModel = String(cString: modelIdentifierCString)
            }
        }

        IOObjectRelease(service)
        return macModel ?? "Unknown"
    }
}
