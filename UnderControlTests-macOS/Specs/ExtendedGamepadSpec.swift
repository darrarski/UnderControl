import Quick
import Nimble
import RxTest
import GameController
@testable import UnderControl

class ExtendedGamepadSpec: QuickSpec {

    override func spec() {
        describe("ExtendedGamepad") {
            var sut: ExtendedGamepad!
            var gcExtendedGamepad: GCExtendedGamepadDouble!

            beforeEach {
                gcExtendedGamepad = GCExtendedGamepadDouble()
                sut = ExtendedGamepad(gcExtendedGamepad: gcExtendedGamepad)
            }

            it("should have correct gcExtendedGamepad") {
                expect(sut.gcExtendedGamepad).to(be(gcExtendedGamepad))
            }

            describe("leftShoulder") {
                var button: Button!

                beforeEach {
                    button = sut.leftShoulder
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcExtendedGamepad.leftShoulder))
                }
            }

            describe("rightShoulder") {
                var button: Button!

                beforeEach {
                    button = sut.rightShoulder
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcExtendedGamepad.rightShoulder))
                }
            }

            describe("dpad") {
                var dpad: DirectionPad!

                beforeEach {
                    dpad = sut.dpad
                }

                it("should have correct gcDirectionPad") {
                    expect(dpad.gcDirectionPad).to(be(gcExtendedGamepad.dpad))
                }
            }

            describe("buttonA") {
                var button: Button!

                beforeEach {
                    button = sut.buttonA
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcExtendedGamepad.buttonA))
                }
            }

            describe("buttonB") {
                var button: Button!

                beforeEach {
                    button = sut.buttonB
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcExtendedGamepad.buttonB))
                }
            }

            describe("buttonX") {
                var button: Button!

                beforeEach {
                    button = sut.buttonX
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcExtendedGamepad.buttonX))
                }
            }

            describe("buttonY") {
                var button: Button!

                beforeEach {
                    button = sut.buttonY
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcExtendedGamepad.buttonY))
                }
            }

            describe("leftTrigger") {
                var button: Button!

                beforeEach {
                    button = sut.leftTrigger
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcExtendedGamepad.leftTrigger))
                }
            }

            describe("rightTrigger") {
                var button: Button!

                beforeEach {
                    button = sut.rightTrigger
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcExtendedGamepad.rightTrigger))
                }
            }

            context("value changed") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<GCControllerElement>!
                var element: GCControllerElement!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(GCControllerElement.self)
                    element = GCControllerElement()
                    _ = sut.valueChanged.subscribe(observer)
                    gcExtendedGamepad.valueChangedHandler?(gcExtendedGamepad, element)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }

                it("should pass correct element") {
                    expect(observer.events.first?.value.element).to(be(element))
                }
            }
        }
    }
}
