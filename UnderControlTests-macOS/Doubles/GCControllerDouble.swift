import GameController
@testable import UnderControl

class GCControllerDouble: GCControllerType {

    var controllerPausedHandler: ((GCController) -> Void)?
    var gcGamepad: GCGamepadType?

}
