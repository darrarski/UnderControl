import GameController
import RxSwift

public class Gamepad: MicroGamepadProfile, GamepadProfile {

    public init(gcGamepad: GCGamepad) {
        self.gcGamepad = gcGamepad
        leftShoulder = Button(gcButton: gcGamepad.leftShoulder)
        rightShoulder = Button(gcButton: gcGamepad.rightShoulder)
        dpad = DirectionPad(gcDirectionPad: gcGamepad.dpad)
        buttonA = Button(gcButton: gcGamepad.buttonA)
        buttonB = Button(gcButton: gcGamepad.buttonB)
        buttonX = Button(gcButton: gcGamepad.buttonX)
        buttonY = Button(gcButton: gcGamepad.buttonY)
        setupHandlers()
    }

    public let gcGamepad: GCGamepad

    public let leftShoulder: Button
    public let rightShoulder: Button
    public let dpad: DirectionPad
    public let buttonA: Button
    public let buttonB: Button
    public let buttonX: Button
    public let buttonY: Button

    public var valueChanged: Observable<GCControllerElement> {
        return valueChangedSubject.asObservable()
    }

    // MARK: Private

    private let valueChangedSubject = PublishSubject<GCControllerElement>()

    private func setupHandlers() {
        gcGamepad.valueChangedHandler = { [weak self] in self?.valueChangedSubject.onNext($1) }
    }

}

extension Gamepad {

    public convenience init?(gcGamepad: GCGamepad?) {
        guard let gcGamepad = gcGamepad else { return nil }
        self.init(gcGamepad: gcGamepad)
    }

}
