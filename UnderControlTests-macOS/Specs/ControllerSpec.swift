import Quick
import Nimble
import RxTest
import GameController
@testable import UnderControl

class ControllerSpec: QuickSpec {

    override func spec() {
        describe("Controller") {
            var sut: Controller!
            var gcController: GCController!

            beforeEach {
                gcController = GCControllerDouble()
                sut = Controller(gcController: gcController)
            }

            it("should have correct gcController") {
                expect(sut.gcController).to(be(gcController))
            }

            it("should have no gamepad") {
                expect(sut.gamepad).to(beNil())
            }

            context("pause button press") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<Void>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(Void.self)
                    _ = sut.pauseButtonPress.subscribe(observer)
                    gcController.controllerPausedHandler?(gcController)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }
            }
        }

        describe("Controller with Gamepad") {
            var sut: Controller!
            var gcGamepad: GCGamepadDouble!

            beforeEach {
                gcGamepad = GCGamepadDouble()
                let gcController = GCControllerDouble()
                gcController.gamepad = gcGamepad
                sut = Controller(gcController: gcController)
            }

            describe("gamepad") {
                var gamepad: Gamepad!

                beforeEach {
                    gamepad = sut.gamepad
                }

                it("should not be nil") {
                    expect(gamepad).notTo(beNil())
                }

                it("should have correct gcGamepad") {
                    expect(gamepad.gcGamepad).to(be(gcGamepad))
                }
            }
        }

        describe("Controller with MicroGamepad") {
            var sut: Controller!
            var gcMicroGamepad: GCMicroGamepadDouble!

            beforeEach {
                gcMicroGamepad = GCMicroGamepadDouble()
                let gcController = GCControllerDouble()
                gcController.microGamepad = gcMicroGamepad
                sut = Controller(gcController: gcController)
            }

            describe("microGamepad") {
                var microGamepad: MicroGamepad!

                beforeEach {
                    microGamepad = sut.microGamepad
                }

                it("should not be nil") {
                    expect(microGamepad).notTo(beNil())
                }

                it("should have correct gcMicroGamepad") {
                    expect(microGamepad.gcMicroGamepad).to(be(gcMicroGamepad))
                }
            }
        }

        describe("Controller with ExteddedGamepad") {
            var sut: Controller!
            var gcExtendedGamepad: GCExtendedGamepadDouble!

            beforeEach {
                gcExtendedGamepad = GCExtendedGamepadDouble()
                let gcController = GCControllerDouble()
                gcController.extendedGamepad = gcExtendedGamepad
                sut = Controller(gcController: gcController)
            }

            describe("extendedGamepad") {
                var extendedGamepad: ExtendedGamepad!

                beforeEach {
                    extendedGamepad = sut.extendedGamepad
                }

                it("should not be nil") {
                    expect(extendedGamepad).notTo(beNil())
                }

                it("should have correct gcExtendedGamepad") {
                    expect(extendedGamepad.gcExtendedGamepad).to(be(gcExtendedGamepad))
                }
            }
        }
    }
}
