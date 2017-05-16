import GameController
import RxSwift

public class Gamepad {

    public init(gcGamepad: GCGamepadType) {
        self.gcGamepad = gcGamepad
        setupHandlers()
    }

    public let gcGamepad: GCGamepadType

    public var valueChanged: Observable<Void> {
        return valueChangedSubject.asObservable()
    }

    private let valueChangedSubject = PublishSubject<Void>()

    private func setupHandlers() {
        gcGamepad.valueChangedHandler = { [weak self] _ in self?.valueChangedSubject.onNext() }
    }

}

extension Gamepad {

    public convenience init?(gcGamepad: GCGamepadType?) {
        guard let gcGamepad = gcGamepad else { return nil }
        self.init(gcGamepad: gcGamepad)
    }

}
