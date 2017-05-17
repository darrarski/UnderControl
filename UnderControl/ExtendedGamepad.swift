import GameController
import RxSwift

public class ExtendedGamepad {

    public init(gcExtendedGamepad: GCExtendedGamepad) {
        self.gcExtendedGamepad = gcExtendedGamepad
        leftShoulder = Button(gcButton: gcExtendedGamepad.leftShoulder)
        rightShoulder = Button(gcButton: gcExtendedGamepad.rightShoulder)
        dpad = DirectionPad(gcDirectionPad: gcExtendedGamepad.dpad)
        buttonA = Button(gcButton: gcExtendedGamepad.buttonA)
        buttonB = Button(gcButton: gcExtendedGamepad.buttonB)
        buttonX = Button(gcButton: gcExtendedGamepad.buttonX)
        buttonY = Button(gcButton: gcExtendedGamepad.buttonY)
        leftThumbstick = DirectionPad(gcDirectionPad: gcExtendedGamepad.leftThumbstick)
        rightThumbstick = DirectionPad(gcDirectionPad: gcExtendedGamepad.rightThumbstick)
        leftTrigger = Button(gcButton: gcExtendedGamepad.leftTrigger)
        rightTrigger = Button(gcButton: gcExtendedGamepad.rightTrigger)
        setupHandlers()
    }

    public let gcExtendedGamepad: GCExtendedGamepad

    public let leftShoulder: Button
    public let rightShoulder: Button
    public let dpad: DirectionPad
    public let buttonA: Button
    public let buttonB: Button
    public let buttonX: Button
    public let buttonY: Button
    public let leftThumbstick: DirectionPad
    public let rightThumbstick: DirectionPad
    public let leftTrigger: Button
    public let rightTrigger: Button

    public var valueChanged: Observable<GCControllerElement> {
        return valueChangedSubject.asObservable()
    }

    private let valueChangedSubject = PublishSubject<GCControllerElement>()

    private func setupHandlers() {
        gcExtendedGamepad.valueChangedHandler = { [weak self] in self?.valueChangedSubject.onNext($1) }
    }

}

extension ExtendedGamepad {

    public convenience init?(gcExtendedGamepad: GCExtendedGamepad?) {
        guard let gcExtendedGamepad = gcExtendedGamepad else { return nil }
        self.init(gcExtendedGamepad: gcExtendedGamepad)
    }

}
