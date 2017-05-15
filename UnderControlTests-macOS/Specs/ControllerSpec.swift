import Quick
import Nimble
import RxTest
import Foundation
@testable import UnderControl

class ControllerSpec: QuickSpec {

    override func spec() {
        describe("Controller") {
            var sut: Controller!
            var gcController: GCControllerType!

            beforeEach {
                gcController = GCControllerDouble()
                sut = Controller(gcController: gcController)
            }

            afterEach {
                sut = nil
                gcController = nil
            }

            it("should have correct gcController") {
                expect(sut.gcController).to(be(gcController))
            }
        }
    }
}
