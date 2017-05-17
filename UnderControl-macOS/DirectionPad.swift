import GameController
import RxSwift

public class DirectionPad {

    public init(gcDirectionPad: GCControllerDirectionPad) {
        self.gcDirectionPad = gcDirectionPad
        up = Button(gcButton: gcDirectionPad.up)
        down = Button(gcButton: gcDirectionPad.down)
        left = Button(gcButton: gcDirectionPad.left)
        right = Button(gcButton: gcDirectionPad.right)
        setupHandlers()
    }

    public let gcDirectionPad: GCControllerDirectionPad

    public let up: Button
    public let down: Button
    public let left: Button
    public let right: Button

    public var valueChanged: Observable<(x: Float, y: Float)> {
        return valueChangedSubject.asObservable()
    }

    private let valueChangedSubject = PublishSubject<(x: Float, y: Float)>()

    private func setupHandlers() {
        gcDirectionPad.valueChangedHandler = { [weak self] (_, x, y) in
            self?.valueChangedSubject.onNext((x, y))
        }
    }

}
