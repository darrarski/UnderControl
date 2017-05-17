import GameController
@testable import UnderControl

class GCGamepadDouble: GCGamepad {

    override var valueChangedHandler: GCGamepadValueChangedHandler? {
        get { return _valueChangedHandler }
        set { _valueChangedHandler = newValue }
    }
    private var _valueChangedHandler: GCGamepadValueChangedHandler?

    override var leftShoulder: GCControllerButtonInput { return _leftShoulder }
    private var _leftShoulder = GCControllerButtonInputDouble()

    override var rightShoulder: GCControllerButtonInput { return _rightShoulder }
    private var _rightShoulder = GCControllerButtonInputDouble()

    override var dpad: GCControllerDirectionPad { return _dpad }
    private var _dpad = GCControllerDirectionPad()

    override var buttonA: GCControllerButtonInput { return _buttonA }
    private var _buttonA = GCControllerButtonInputDouble()

    override var buttonB: GCControllerButtonInput { return _buttonB }
    private var _buttonB = GCControllerButtonInputDouble()

    override var buttonX: GCControllerButtonInput { return _buttonX }
    private var _buttonX = GCControllerButtonInputDouble()

    override var buttonY: GCControllerButtonInput { return _buttonY }
    private var _buttonY = GCControllerButtonInputDouble()

}
