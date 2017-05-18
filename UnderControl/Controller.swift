import GameController
import RxSwift

public class Controller {

    public init(gcController: GCController) {
        self.gcController = gcController
        let gamepadObject = Controller.gamepad(with: gcController)
        gamepad = gamepadObject as? GamepadProfile
        extendedGamepad = gamepadObject as? ExtendedGamepadProfile
        microGamepad = gamepadObject as? MicroGamepadProfile
        setupHandlers()
    }

    public let gcController: GCController

    public var pauseButtonPress: Observable<Void> {
        return pauseButtonPressSubject.asObservable()
    }

    public let gamepad: GamepadProfile?
    public let extendedGamepad: ExtendedGamepadProfile?
    public let microGamepad: MicroGamepadProfile?

    // MARK: Private

    private let pauseButtonPressSubject = PublishSubject<Void>()

    private func setupHandlers() {
        gcController.controllerPausedHandler = { [weak self] _ in self?.pauseButtonPressSubject.onNext() }
    }

    private static func gamepad(with gcController: GCController) -> AnyObject? {
        if let gcExtendedGamepad = gcController.extendedGamepad {
            return ExtendedGamepad(gcExtendedGamepad: gcExtendedGamepad)
        }
        if let gcGamepad = gcController.gamepad {
            return Gamepad(gcGamepad: gcGamepad)
        }
        if let gcMicroGamepad = gcController.microGamepad {
            return MicroGamepad(gcMicroGamepad: gcMicroGamepad)
        }
        return nil
    }

}
