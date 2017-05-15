import RxSwift

public class Controller {

    public init(gcController: GCControllerType) {
        self.gcController = gcController
        setupHandlers()
    }

    public let gcController: GCControllerType

    public var pauseButtonPress: Observable<Void> {
        return pauseButtonPressSubject.asObservable()
    }

    private let pauseButtonPressSubject = PublishSubject<Void>()

    private func setupHandlers() {
        gcController.controllerPausedHandler = { [weak self] _ in self?.pauseButtonPressSubject.onNext() }
    }

}
