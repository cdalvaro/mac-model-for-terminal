//
//  MacModelForTerminal.swift
//
//
//  Created by Carlos Álvaro on 10/6/23.
//

// https://www.fivestars.blog/articles/ultimate-guide-swift-executables/

@main
public struct MacModelForTerminal {
    private var macModel: MacModel

    public var symbol: String? {
        var symbol: String?

        switch macModel.getMacModel() {
        case "MacBookPro17,1":
            symbol = "􀟛  MacBook"
        case "MacPro6,1":
            symbol = "􀦱 Mac Pro"
        case "Mac13,2":
            symbol = "􁏍  Mac Studio"
        default:
            break
        }

        return symbol
    }

    init(macModel: MacModel = MacModel()) {
        self.macModel = macModel
    }

    public static func main() {
        let macModelForTerminal = MacModelForTerminal()
        if let symbol = macModelForTerminal.symbol {
            print(symbol, terminator: "")
        }
    }
}
