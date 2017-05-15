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

    var controllerDidConnect: Observable<GCControllerType> {
        return controllerDidConnectSubject.asObservable()
    }

    var controllerDidDisconnect: Observable<GCControllerType> {
        return controllerDidDisconnectSubject.asObservable()
    }

    private let controllerDidConnectSubject = PublishSubject<GCControllerType>()
    private let controllerDidDisconnectSubject = PublishSubject<GCControllerType>()
    private var controllerDidConnectObserver: Any?
    private var controllerDidDisconnectObserver: Any?

    private func setupControllerConnectionObservers() {
        controllerDidConnectObserver = notificationCenter.addObserver(
            forName: Notification.Name.GCControllerDidConnect,
            object: nil,
            queue: OperationQueue.main,
            using: { [weak self] in
                guard let controller = $0.object as? GCControllerType else { return }
                self?.controllerDidConnectSubject.onNext(controller)
            }
        )
        controllerDidDisconnectObserver = notificationCenter.addObserver(
            forName: Notification.Name.GCControllerDidDisconnect,
            object: nil,
            queue: OperationQueue.main,
            using: { [weak self] in
                guard let controller = $0.object as? GCControllerType else { return }
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
