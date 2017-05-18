import GameController
import RxSwift

public protocol ExtendedGamepadProfile: class {
    var leftShoulder: Button { get }
    var rightShoulder: Button { get }
    var dpad: DirectionPad { get }
    var buttonA: Button { get }
    var buttonB: Button { get }
    var buttonX: Button { get }
    var buttonY: Button { get }
    var leftThumbstick: DirectionPad { get }
    var rightThumbstick: DirectionPad { get }
    var leftTrigger: Button { get }
    var rightTrigger: Button { get }
    var valueChanged: Observable<GCControllerElement> { get }
}
