import GameController
import RxSwift

public class Gamepad {

    public init(gcGamepad: GCGamepad) {
        self.gcGamepad = gcGamepad
        setupHandlers()
    }

    public let gcGamepad: GCGamepad

    public var valueChanged: Observable<GCControllerElement> {
        return valueChangedSubject.asObservable()
    }

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
