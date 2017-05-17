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

            describe("xAxis") {
                var axis: Axis!

                beforeEach {
                    axis = sut.xAxis
                }

                it("should have correct gcAxis") {
                    expect(axis.gcAxis).to(be(gcDirectionPad.xAxis))
                }
            }

            describe("yAxis") {
                var axis: Axis!

                beforeEach {
                    axis = sut.yAxis
                }

                it("should have correct gcAxis") {
                    expect(axis.gcAxis).to(be(gcDirectionPad.yAxis))
                }
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

            context("value changed to x=-0.75 y=0.25") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<(x: Float, y: Float)>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver((x: Float, y: Float).self)
                    _ = sut.valueChanged.subscribe(observer)
                    gcDirectionPad.valueChangedHandler?(gcDirectionPad, -0.75, 0.25)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }

                it("should pass correct value") {
                    expect(observer.events.first?.value.element?.x).to(equal(-0.75))
                    expect(observer.events.first?.value.element?.y).to(equal(0.25))
                }
            }

            context("value changed to x=0.25 y:-0.75") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<(x: Float, y: Float)>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver((x: Float, y: Float).self)
                    _ = sut.valueChanged.subscribe(observer)
                    gcDirectionPad.valueChangedHandler?(gcDirectionPad, 0.25, -0.75)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }

                it("should pass correct value") {
                    expect(observer.events.first?.value.element?.x).to(equal(0.25))
                    expect(observer.events.first?.value.element?.y).to(equal(-0.75))
                }
            }
        }
    }
}
