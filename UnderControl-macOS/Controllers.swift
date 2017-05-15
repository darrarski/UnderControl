import Foundation
import GameController
import RxSwift

public class Controllers {

    public init(notificationCenter: NotificationCenter = NotificationCenter.default) {
        self.notificationCenter = notificationCenter
        setupControllerConnectionObservers()
    }

    deinit {
        removeControllerConnectionObservers()
    }

    private let notificationCenter: NotificationCenter

    // MARK: Controller connection observing

    var controllerDidConnect: Observable<Controller> {
        return controllerDidConnectSubject.asObservable()
    }

    var controllerDidDisconnect: Observable<Controller> {
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
            using: { [weak self] in
                guard let gcController = $0.object as? GCControllerType else { return }
                let controller = Controller(gcController: gcController)
                self?.controllerDidConnectSubject.onNext(controller)
            }
        )
        controllerDidDisconnectObserver = notificationCenter.addObserver(
            forName: Notification.Name.GCControllerDidDisconnect,
            object: nil,
            queue: OperationQueue.main,
            using: { [weak self] in
                guard let gcController = $0.object as? GCControllerType else { return }
                let controller = Controller(gcController: gcController)
                self?.controllerDidDisconnectSubject.onNext(controller)
            }
        )
    }

    private func removeControllerConnectionObservers() {
        let observers = [controllerDidConnectObserver, controllerDidDisconnectObserver].flatMap { $0 }
        observers.forEach { notificationCenter.removeObserver($0) }
        controllerDidConnectObserver = nil
        controllerDidDisconnectObserver = nil
    }

}
