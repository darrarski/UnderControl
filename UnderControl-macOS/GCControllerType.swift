import GameController

public protocol GCControllerType: class {
    var controllerPausedHandler: ((GCController) -> Void)? { get set }
}

extension GCController: GCControllerType {}
