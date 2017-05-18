import GameController
import RxSwift

public protocol MicroGamepadProfile: class {
    var dpad: DirectionPad { get }
    var buttonA: Button { get }
    var buttonX: Button { get }
    var valueChanged: Observable<GCControllerElement> { get }
}
