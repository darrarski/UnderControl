import GameController
import RxSwift

public class MicroGamepad: MicroGamepadProfile {

    public init(gcMicroGamepad: GCMicroGamepad) {
        self.gcMicroGamepad = gcMicroGamepad
        dpad = DirectionPad(gcDirectionPad: gcMicroGamepad.dpad)
        buttonA = Button(gcButton: gcMicroGamepad.buttonA)
        buttonX = Button(gcButton: gcMicroGamepad.buttonX)
        setupHandlers()
    }

    public let gcMicroGamepad: GCMicroGamepad

    public let dpad: DirectionPad
    public let buttonA: Button
    public let buttonX: Button

    public var valueChanged: Observable<GCControllerElement> {
        return valueChangedSubject.asObservable()
    }

    // MARK: Private

    private let valueChangedSubject = PublishSubject<GCControllerElement>()

    private func setupHandlers() {
        gcMicroGamepad.valueChangedHandler = { [weak self] in self?.valueChangedSubject.onNext($1) }
    }

}

extension MicroGamepad {

    public convenience init?(gcMicroGamepad: GCMicroGamepad?) {
        guard let gcMicroGamepad = gcMicroGamepad else { return nil }
        self.init(gcMicroGamepad: gcMicroGamepad)
    }

}
