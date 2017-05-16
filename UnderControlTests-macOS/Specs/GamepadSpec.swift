import Quick
import Nimble
import RxTest
import GameController
@testable import UnderControl

class GamepadSpec: QuickSpec {

    override func spec() {
        describe("Gamepad") {
            var sut: Gamepad!
            var gcGamepad: GCGamepadDouble!

            beforeEach {
                gcGamepad = GCGamepadDouble()
                sut = Gamepad(gcGamepad: gcGamepad)
            }

            it("should have correct gcGamepad") {
                expect(sut.gcGamepad).to(be(gcGamepad))
            }

            describe("leftShoulder") {
                var button: Button!

                beforeEach {
                    button = sut.leftShoulder
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcGamepad.leftShoulder))
                }
            }

            describe("rightShoulder") {
                var button: Button!

                beforeEach {
                    button = sut.leftShoulder
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcGamepad.leftShoulder))
                }
            }

            describe("buttonA") {
                var button: Button!

                beforeEach {
                    button = sut.buttonA
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcGamepad.buttonA))
                }
            }

            describe("buttonB") {
                var button: Button!

                beforeEach {
                    button = sut.buttonB
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcGamepad.buttonB))
                }
            }

            describe("buttonX") {
                var button: Button!

                beforeEach {
                    button = sut.buttonX
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcGamepad.buttonX))
                }
            }

            describe("buttonY") {
                var button: Button!

                beforeEach {
                    button = sut.buttonY
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcGamepad.buttonY))
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
                    gcGamepad.valueChangedHandler?(gcGamepad, element)
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
