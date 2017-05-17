import Quick
import Nimble
import RxTest
import GameController
@testable import UnderControl

class MicroGamepadSpec: QuickSpec {

    override func spec() {
        describe("MicroGamepad") {
            var sut: MicroGamepad!
            var gcMicroGamepad: GCMicroGamepadDouble!

            beforeEach {
                gcMicroGamepad = GCMicroGamepadDouble()
                sut = MicroGamepad(gcMicroGamepad: gcMicroGamepad)
            }

            it("should have correct gcMicroGamepad") {
                expect(sut.gcMicroGamepad).to(be(gcMicroGamepad))
            }

            describe("dpad") {
                var dpad: DirectionPad!

                beforeEach {
                    dpad = sut.dpad
                }

                it("should have correct gcDirectionPad") {
                    expect(dpad.gcDirectionPad).to(be(gcMicroGamepad.dpad))
                }
            }

            describe("buttonA") {
                var button: Button!

                beforeEach {
                    button = sut.buttonA
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcMicroGamepad.buttonA))
                }
            }

            describe("buttonX") {
                var button: Button!

                beforeEach {
                    button = sut.buttonX
                }

                it("should have correct gcButton") {
                    expect(button.gcButton).to(be(gcMicroGamepad.buttonX))
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
                    gcMicroGamepad.valueChangedHandler?(gcMicroGamepad, element)
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
