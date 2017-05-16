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
                var observer: TestableObserver<Void>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(Void.self)
                    _ = sut.valueChanged.subscribe(observer)
                    gcGamepad.valueChangedHandler?(gcGamepad, GCControllerElement())
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }
            }
        }
    }
}
