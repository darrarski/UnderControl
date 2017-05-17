import Quick
import Nimble
import RxTest
import GameController
@testable import UnderControl

class DirectionPadSpec: QuickSpec {

    override func spec() {
        describe("DirectionPad") {
            var sut: DirectionPad!
            var gcDirectionPad: GCControllerDirectionPad!

            beforeEach {
                gcDirectionPad = GCControllerDirectionPadDuble()
                sut = DirectionPad(gcDirectionPad: gcDirectionPad)
            }

            it("should have correct gcDirectionPad") {
                expect(sut.gcDirectionPad).to(be(gcDirectionPad))
            }

            describe("up") {
                var button: Button!

                beforeEach {
                    button = sut.up
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcDirectionPad.up))
                }
            }

            describe("down") {
                var button: Button!

                beforeEach {
                    button = sut.down
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcDirectionPad.down))
                }
            }

            describe("left") {
                var button: Button!

                beforeEach {
                    button = sut.left
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcDirectionPad.left))
                }
            }

            describe("right") {
                var button: Button!

                beforeEach {
                    button = sut.right
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcDirectionPad.right))
                }
            }
        }
    }
}
