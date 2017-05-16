import GameController
import RxSwift

public class Controller {

    public init(gcController: GCController) {
        self.gcController = gcController
        gamepad = Gamepad(gcGamepad: gcController.gamepad)
        setupHandlers()
    }

    public let gcController: GCController

    public var pauseButtonPress: Observable<Void> {
        return pauseButtonPressSubject.asObservable()
    }

    public let gamepad: Gamepad?

    private let pauseButtonPressSubject = PublishSubject<Void>()

    private func setupHandlers() {
        gcController.controllerPausedHandler = { [weak self] _ in self?.pauseButtonPressSubject.onNext() }
    }

}
