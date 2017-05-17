import GameController
import RxSwift

public class Axis {

    public init(gcAxis: GCControllerAxisInput) {
        self.gcAxis = gcAxis
        setupHandlers()
    }

    public let gcAxis: GCControllerAxisInput

    public var valueChanged: Observable<Float> {
        return valueChangedSubject.asObservable()
    }

    private let valueChangedSubject = PublishSubject<Float>()

    private func setupHandlers() {
        gcAxis.valueChangedHandler = { [weak self] (_, value) in
            self?.valueChangedSubject.onNext(value)
        }
    }

}
