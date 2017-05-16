import GameController

public protocol GCControllerType: class {
    var controllerPausedHandler: ((GCController) -> Void)? { get set }
    var gcGamepad: GCGamepadType? { get }
}

extension GCController: GCControllerType {

    public var gcGamepad: GCGamepadType? { return gamepad }

}
