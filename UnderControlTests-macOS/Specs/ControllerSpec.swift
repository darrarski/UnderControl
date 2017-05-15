import Quick
import Nimble
import RxTest
import GameController
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

            context("pause button press") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<Void>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(Void.self)
                    _ = sut.pauseButtonPress.subscribe(observer)
                    gcController.controllerPausedHandler?(GCController())
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }
            }
        }
    }
}
