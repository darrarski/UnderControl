import XCTest
@testable import UnderControl

class UnderControlTests: XCTestCase {

    var controllers: Controllers!

    override func setUp() {
        super.setUp()
        controllers = Controllers()
    }

    override func tearDown() {
        controllers = nil
        super.tearDown()
    }

    func testExample() {
        XCTAssert(true)
    }

}
