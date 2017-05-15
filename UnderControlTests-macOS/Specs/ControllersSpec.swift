import Quick
import Nimble
import RxTest
import Foundation
import GameController
@testable import UnderControl

class ControllersSpec: QuickSpec {

    override func spec() {
        describe("Controllers") {
            var sut: Controllers!
            var notificationCenter: NotificationCenter!

            beforeEach {
                notificationCenter = NotificationCenter()
                sut = Controllers(notificationCenter: notificationCenter)
            }

            afterEach {
                sut = nil
                notificationCenter = nil
            }

            describe("controller") {
                var gcController: GCControllerDouble!

                beforeEach {
                    gcController = GCControllerDouble()
                }

                afterEach {
                    gcController = nil
                }

                context("did connect") {
                    var scheduler: TestScheduler!
                    var observer: TestableObserver<GCControllerType>!

                    beforeEach {
                        scheduler = TestScheduler(initialClock: 0)
                        observer = scheduler.createObserver(GCControllerType.self)
                        _ = sut.controllerDidConnect.subscribe(observer)
                        notificationCenter.post(name: Notification.Name.GCControllerDidConnect, object: gcController)
                    }

                    it("should produce one event") {
                        expect(observer.events.count).to(equal(1))
                    }

                    it("should produce correct event") {
                        expect(observer.events.first?.value.element).to(be(gcController))
                    }
                }

                context("did disconnect") {
                    var scheduler: TestScheduler!
                    var observer: TestableObserver<GCControllerType>!

                    beforeEach {
                        scheduler = TestScheduler(initialClock: 0)
                        observer = scheduler.createObserver(GCControllerType.self)
                        _ = sut.controllerDidDisconnect.subscribe(observer)
                        notificationCenter.post(name: Notification.Name.GCControllerDidDisconnect, object: gcController)
                    }

                    it("should produce one event") {
                        expect(observer.events.count).to(equal(1))
                    }

                    it("should produce correct event") {
                        expect(observer.events.first?.value.element).to(be(gcController))
                    }
                }
            }

            describe("invalid controller") {
                context("did connect") {
                    var scheduler: TestScheduler!
                    var observer: TestableObserver<GCControllerType>!

                    beforeEach {
                        scheduler = TestScheduler(initialClock: 0)
                        observer = scheduler.createObserver(GCControllerType.self)
                        _ = sut.controllerDidConnect.subscribe(observer)
                        notificationCenter.post(
                            name: Notification.Name.GCControllerDidConnect,
                            object: "not a controller"
                        )
                    }

                    it("should produce no events") {
                        expect(observer.events).to(beEmpty())
                    }
                }

                context("did disconnect") {
                    var scheduler: TestScheduler!
                    var observer: TestableObserver<GCControllerType>!

                    beforeEach {
                        scheduler = TestScheduler(initialClock: 0)
                        observer = scheduler.createObserver(GCControllerType.self)
                        _ = sut.controllerDidDisconnect.subscribe(observer)
                        notificationCenter.post(
                            name: Notification.Name.GCControllerDidDisconnect,
                            object: "not a controller"
                        )
                    }

                    it("should produce no events") {
                        expect(observer.events).to(beEmpty())
                    }
                }
            }
        }
    }

}
