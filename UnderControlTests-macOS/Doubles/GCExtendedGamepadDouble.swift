import GameController
@testable import UnderControl

class GCExtendedGamepadDouble: GCExtendedGamepad {

    override var valueChangedHandler: GCExtendedGamepadValueChangedHandler? {
        get { return _valueChangedHandler }
        set { _valueChangedHandler = newValue }
    }
    private var _valueChangedHandler: GCExtendedGamepadValueChangedHandler?

    override var leftShoulder: GCControllerButtonInput { return _leftShoulder }
    private var _leftShoulder = GCControllerButtonInputDouble()

    override var rightShoulder: GCControllerButtonInput { return _rightShoulder }
    private var _rightShoulder = GCControllerButtonInputDouble()

    override var buttonA: GCControllerButtonInput { return _buttonA }
    private var _buttonA = GCControllerButtonInputDouble()

    override var buttonB: GCControllerButtonInput { return _buttonB }
    private var _buttonB = GCControllerButtonInputDouble()

    override var buttonX: GCControllerButtonInput { return _buttonX }
    private var _buttonX = GCControllerButtonInputDouble()

    override var buttonY: GCControllerButtonInput { return _buttonY }
    private var _buttonY = GCControllerButtonInputDouble()

    override var leftTrigger: GCControllerButtonInput { return _leftTrigger }
    private var _leftTrigger = GCControllerButtonInputDouble()

    override var rightTrigger: GCControllerButtonInput { return _rightTrigger }
    private var _rightTrigger = GCControllerButtonInputDouble()

}
