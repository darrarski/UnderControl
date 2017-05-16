import RxSwift

public class Controller {

    public init(gcController: GCControllerType) {
        self.gcController = gcController
        gamepad = Gamepad(gcGamepad: gcController.gcGamepad)
        setupHandlers()
    }

    public let gcController: GCControllerType

    public var pauseButtonPress: Observable<Void> {
        return pauseButtonPressSubject.asObservable()
    }

    public let gamepad: Gamepad?

    private let pauseButtonPressSubject = PublishSubject<Void>()

    private func setupHandlers() {
        gcController.controllerPausedHandler = { [weak self] _ in self?.pauseButtonPressSubject.onNext() }
    }

}
