import Quick
import Nimble
import RxTest
import GameController
@testable import UnderControl

class ButtonSpec: QuickSpec {

    override func spec() {
        describe("Button") {
            var sut: Button!
            var gcButton: GCControllerButtonInputDouble!

            beforeEach {
                gcButton = GCControllerButtonInputDouble()
                sut = Button(gcButton: gcButton)
            }

            it("should have correct gcButton") {
                expect(sut.gcButton).to(be(gcButton))
            }

            context("value changed to 0.75") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<Float>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(Float.self)
                    _ = sut.valueChanged.subscribe(observer)
                    gcButton.valueChangedHandler?(gcButton, 0.75, true)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }

                it("should pass correct value") {
                    expect(observer.events.first?.value.element).to(equal(0.75))
                }
            }

            context("value changed to 0.25") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<Float>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(Float.self)
                    _ = sut.valueChanged.subscribe(observer)
                    gcButton.valueChangedHandler?(gcButton, 0.25, true)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }

                it("should pass correct value") {
                    expect(observer.events.first?.value.element).to(equal(0.25))
                }
            }

            context("pressed") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<Bool>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(Bool.self)
                    _ = sut.pressedChanged.subscribe(observer)
                    gcButton.pressedChangedHandler?(gcButton, 0.2, true)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }

                it("should pass correct value") {
                    expect(observer.events.first?.value.element).to(beTrue())
                }
            }

            context("depressed") {
                var scheduler: TestScheduler!
                var observer: TestableObserver<Bool>!

                beforeEach {
                    scheduler = TestScheduler(initialClock: 0)
                    observer = scheduler.createObserver(Bool.self)
                    _ = sut.pressedChanged.subscribe(observer)
                    gcButton.pressedChangedHandler?(gcButton, 0, false)
                }

                it("should produce one event") {
                    expect(observer.events.count).to(equal(1))
                }

                it("should pass correct value") {
                    expect(observer.events.first?.value.element).to(beFalse())
                }
            }
        }
    }
}
