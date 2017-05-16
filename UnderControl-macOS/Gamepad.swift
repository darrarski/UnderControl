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
