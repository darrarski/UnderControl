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
