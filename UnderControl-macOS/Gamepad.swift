import GameController
import RxSwift

public class Gamepad {

    public init(gcGamepad: GCGamepad) {
        self.gcGamepad = gcGamepad
        setupHandlers()
    }

    public let gcGamepad: GCGamepad

    public var valueChanged: Observable<Void> {
        return valueChangedSubject.asObservable()
    }

    private let valueChangedSubject = PublishSubject<Void>()

    private func setupHandlers() {
        gcGamepad.valueChangedHandler = { [weak self] _ in self?.valueChangedSubject.onNext() }
    }

}

extension Gamepad {

    public convenience init?(gcGamepad: GCGamepad?) {
        guard let gcGamepad = gcGamepad else { return nil }
        self.init(gcGamepad: gcGamepad)
    }

}
