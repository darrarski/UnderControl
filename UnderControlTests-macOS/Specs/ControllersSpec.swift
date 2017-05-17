import Quick
import Nimble
import RxTest
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

            describe("controller") {
                var gcController: GCControllerDouble!

                beforeEach {
                    gcController = GCControllerDouble()
                }

                context("did connect") {
                    var scheduler: TestScheduler!
                    var observer: TestableObserver<Controller>!

                    beforeEach {
                        scheduler = TestScheduler(initialClock: 0)
                        observer = scheduler.createObserver(Controller.self)
                        _ = sut.controllerDidConnect.subscribe(observer)
                        notificationCenter.post(
                            name: Notification.Name.GCControllerDidConnect,
                            object: gcController
                        )
                    }

                    it("should produce one event") {
                        expect(observer.events.count).to(equal(1))
                    }

                    it("should produce correct event") {
                        expect(observer.events.first?.value.element?.gcController).to(be(gcController))
                    }

                    context("did disconnect") {
                        var scheduler: TestScheduler!
                        var observer: TestableObserver<Controller>!

                        beforeEach {
                            scheduler = TestScheduler(initialClock: 0)
                            observer = scheduler.createObserver(Controller.self)
                            _ = sut.controllerDidDisconnect.subscribe(observer)
                            notificationCenter.post(
                                name: Notification.Name.GCControllerDidDisconnect,
                                object: gcController
                            )
                        }

                        it("should produce one event") {
                            expect(observer.events.count).to(equal(1))
                        }

                        it("should produce correct event") {
                            expect(observer.events.first?.value.element?.gcController).to(be(gcController))
                        }
                    }
                }

                context("did disconnect") {
                    var scheduler: TestScheduler!
                    var observer: TestableObserver<Controller>!

                    beforeEach {
                        scheduler = TestScheduler(initialClock: 0)
                        observer = scheduler.createObserver(Controller.self)
                        _ = sut.controllerDidDisconnect.subscribe(observer)
                        notificationCenter.post(
                            name: Notification.Name.GCControllerDidDisconnect,
                            object: gcController
                        )
                    }

                    it("should produce no events") {
                        expect(observer.events).to(beEmpty())
                    }
                }

                context("did connect twice") {
                    var scheduler: TestScheduler!
                    var observer: TestableObserver<(controller: Controller, connected: Bool)>!

                    beforeEach {
                        scheduler = TestScheduler(initialClock: 0)
                        observer = scheduler.createObserver((controller: Controller, connected: Bool).self)
                        _ = sut.controllerDidConnect.map { ($0, true) }.subscribe(observer)
                        _ = sut.controllerDidDisconnect.map { ($0, false) }.subscribe(observer)
                        notificationCenter.post(
                            name: Notification.Name.GCControllerDidConnect,
                            object: gcController
                        )
                        notificationCenter.post(
                            name: Notification.Name.GCControllerDidConnect,
                            object: gcController
                        )
                    }

                    it("should produce three event") {
                        expect(observer.events.count).to(equal(3))
                    }

                    it("should produce correct events") {
                        expect(observer.events[0].value.element?.controller.gcController).to(be(gcController))
                        expect(observer.events[0].value.element?.connected).to(beTrue())
                        expect(observer.events[1].value.element?.controller.gcController).to(be(gcController))
                        expect(observer.events[1].value.element?.connected).to(beFalse())
                        expect(observer.events[2].value.element?.controller.gcController).to(be(gcController))
                        expect(observer.events[2].value.element?.connected).to(beTrue())
                    }
                }
            }

            describe("invalid controller") {
                context("did connect") {
                    var scheduler: TestScheduler!
                    var observer: TestableObserver<Controller>!

                    beforeEach {
                        scheduler = TestScheduler(initialClock: 0)
                        observer = scheduler.createObserver(Controller.self)
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
                    var observer: TestableObserver<Controller>!

                    beforeEach {
                        scheduler = TestScheduler(initialClock: 0)
                        observer = scheduler.createObserver(Controller.self)
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
