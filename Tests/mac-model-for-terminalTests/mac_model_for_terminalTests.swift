import XCTest
@testable import mac_model_for_terminal

final class mac_model_for_terminalTests: XCTestCase {
    
    class MacModelMock: MacModel {
        private var macModel: String
        
        init(macModel: String) {
            self.macModel = macModel
        }
        
        override func getMacModel() -> String {
            return macModel
        }
    }
    
    func testMacBook() throws {
        let macModelMock = MacModelMock(macModel: "MacBookPro17,1")
        let macModelForTerminal = mac_model_for_terminal(macModel: macModelMock)
        XCTAssertEqual(macModelForTerminal.symbol, "􀟛  MacBook")
    }
    
    func testMacPro() throws {
        let macModelMock = MacModelMock(macModel: "MacPro6,1")
        let macModelForTerminal = mac_model_for_terminal(macModel: macModelMock)
        XCTAssertEqual(macModelForTerminal.symbol, "􀦱 Mac Pro")
    }
    
    func testMacStudio() throws {
        let macModelMock = MacModelMock(macModel: "Mac13,2")
        let macModelForTerminal = mac_model_for_terminal(macModel: macModelMock)
        XCTAssertEqual(macModelForTerminal.symbol, "􁏍  Mac Studio")
    }
}
