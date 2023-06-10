
// https://www.fivestars.blog/articles/ultimate-guide-swift-executables/

@main
public struct mac_model_for_terminal {
    private var macModel: MacModel
    
    public var symbol: String? {
        var _symbol: String?
        
        switch macModel.getMacModel() {
        case "MacBookPro17,1":
            _symbol = "􀟛  MacBook"
        case "MacPro6,1":
            _symbol = "􀦱 Mac Pro"
        case "Mac13,2":
            _symbol = "􁏍  Mac Studio"
        default:
            break
        }
        
        return _symbol
    }
    
    init(macModel: MacModel = MacModel()) {
        self.macModel = macModel
    }

    public static func main() {
        let macModelForTerminal = mac_model_for_terminal()
        if let symbol = macModelForTerminal.symbol {
            print(symbol, terminator: "")
        }
    }
}
