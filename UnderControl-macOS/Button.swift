import GameController
import RxSwift

public class Button {

    public init(gcButton: GCControllerButtonInput) {
        self.gcButton = gcButton
        setupHandlers()
    }

    public let gcButton: GCControllerButtonInput

    public var pressedChanged: Observable<Bool> {
        return pressedChangedSubject.asObservable()
    }

    public var valueChanged: Observable<Float> {
        return valueChangedSubject.asObservable()
    }

    private let pressedChangedSubject = PublishSubject<Bool>()
    private let valueChangedSubject = PublishSubject<Float>()

    private func setupHandlers() {
        gcButton.pressedChangedHandler = { [weak self] (_, _, isPressed) in
            self?.pressedChangedSubject.onNext(isPressed)
        }
        gcButton.valueChangedHandler = { [weak self] (_, value, _) in
            self?.valueChangedSubject.onNext(value)
        }
    }

}
