import Quick
import Nimble
import RxTest
import GameController
@testable import UnderControl

class ButtonSpec: QuickSpec {

    override func spec() {
        describe("Button") {
            var sut: Button!
            var gcButton: GCControllerButtonInputDouble!

            beforeEach {
                gcButton = GCControllerButtonInputDouble()
                sut = Button(gcButton: gcButton)
            }

            it("should have correct gcButton") {
                expect(sut.gcButton).to(be(gcButton))
            }
        }
    }
}
