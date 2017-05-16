import GameController
import RxSwift

public class MicroGamepad {

    public init(gcMicroGamepad: GCMicroGamepad) {
        self.gcMicroGamepad = gcMicroGamepad
        buttonA = Button(gcButton: gcMicroGamepad.buttonA)
        buttonX = Button(gcButton: gcMicroGamepad.buttonX)
        setupHandlers()
    }

    public let gcMicroGamepad: GCMicroGamepad

    public let buttonA: Button
    public let buttonX: Button

    public var valueChanged: Observable<GCControllerElement> {
        return valueChangedSubject.asObservable()
    }

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