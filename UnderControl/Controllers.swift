import Foundation
import GameController
import RxSwift

public class Controllers {

    public init(notificationCenter: NotificationCenter = NotificationCenter.default) {
        self.notificationCenter = notificationCenter
        connected = GCController.controllers().map { Controller(gcController: $0) }
        setupControllerConnectionObservers()
    }

    deinit {
        removeControllerConnectionObservers()
    }

    public private(set) var connected: [Controller]

    private let notificationCenter: NotificationCenter

    // MARK: Controller connection observing

    public var controllerDidConnect: Observable<Controller> {
        return controllerDidConnectSubject.asObservable()
    }

    public var controllerDidDisconnect: Observable<Controller> {
        return controllerDidDisconnectSubject.asObservable()
    }

    private let controllerDidConnectSubject = PublishSubject<Controller>()
    private let controllerDidDisconnectSubject = PublishSubject<Controller>()
    private var controllerDidConnectObserver: Any?
    private var controllerDidDisconnectObserver: Any?

    private func setupControllerConnectionObservers() {
        controllerDidConnectObserver = notificationCenter.addObserver(
            forName: Notification.Name.GCControllerDidConnect,
            object: nil,
            queue: OperationQueue.main,
            using: { [weak self] in self?.gcControllerDidConnect(notification: $0) }
        )
        controllerDidDisconnectObserver = notificationCenter.addObserver(
            forName: Notification.Name.GCControllerDidDisconnect,
            object: nil,
            queue: OperationQueue.main,
            using: { [weak self] in self?.gcControllerDidDisconnect(notification: $0) }
        )
    }

    private func removeControllerConnectionObservers() {
        let observers = [controllerDidConnectObserver, controllerDidDisconnectObserver].flatMap { $0 }
        observers.forEach { notificationCenter.removeObserver($0) }
        controllerDidConnectObserver = nil
        controllerDidDisconnectObserver = nil
    }

    private func gcControllerDidConnect(notification: Notification) {
        guard let gcController = notification.object as? GCController else { return }
        guard connected.first(where: { $0.gcController == gcController }) == nil else { return }
        let controller = Controller(gcController: gcController)
        connected.append(controller)
        controllerDidConnectSubject.onNext(controller)
    }

    private func gcControllerDidDisconnect(notification: Notification) {
        guard let gcController = notification.object as? GCController else { return }
        guard let (index, controller) = connected.enumerated().first(where: { $1.gcController == gcController }) else {
            return
        }
        connected.remove(at: index)
        controllerDidDisconnectSubject.onNext(controller)
    }

}
