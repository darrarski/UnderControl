import GameController
@testable import UnderControl

class GCControllerDouble: GCController {

    override var controllerPausedHandler: ((GCController) -> Void)? {
        get { return _controllerPausedHandler }
        set { _controllerPausedHandler = newValue }
    }
    private var _controllerPausedHandler: ((GCController) -> Void)?

    override var gamepad: GCGamepad? {
        get { return _gamepad }
        set { _gamepad = newValue }
    }
    private var _gamepad: GCGamepad?

    override var microGamepad: GCMicroGamepad? {
        get { return _microGamepad }
        set { _microGamepad = newValue }
    }
    private var _microGamepad: GCMicroGamepad?

}
