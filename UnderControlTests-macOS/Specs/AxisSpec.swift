import Quick
import Nimble
import RxTest
import GameController
@testable import UnderControl

class AxisSpec: QuickSpec {

    override func spec() {
        describe("Axis") {
            var sut: Axis!
            var gcAxis: GCControllerAxisInputDouble!

            beforeEach {
                gcAxis = GCControllerAxisInputDouble()
                sut = Axis(gcAxis: gcAxis)
            }

            it("should have correct gcAxis") {
                expect(sut.gcAxis).to(be(gcAxis))
            }

            context("value changed to 0.75") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<Float>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(Float.self)
                    _ = sut.valueChanged.subscribe(observer)
                    gcAxis.valueChangedHandler?(gcAxis, 0.75)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }

                it("should pass correct value") {
                    expect(observer.events.first?.value.element).to(equal(0.75))
                }
            }

            context("value changed to -0.25") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<Float>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(Float.self)
                    _ = sut.valueChanged.subscribe(observer)
                    gcAxis.valueChangedHandler?(gcAxis, -0.25)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }

                it("should pass correct value") {
                    expect(observer.events.first?.value.element).to(equal(-0.25))
                }
            }
        }
    }
}
