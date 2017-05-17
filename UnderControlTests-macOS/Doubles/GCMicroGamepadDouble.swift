import GameController
@testable import UnderControl

class GCMicroGamepadDouble: GCMicroGamepad {

    override var valueChangedHandler: GCMicroGamepadValueChangedHandler? {
        get { return _valueChangedHandler }
        set { _valueChangedHandler = newValue }
    }
    private var _valueChangedHandler: GCMicroGamepadValueChangedHandler?

    override var dpad: GCControllerDirectionPad { return _dpad }
    private var _dpad = GCControllerDirectionPad()

    override var buttonA: GCControllerButtonInput { return _buttonA }
    private var _buttonA = GCControllerButtonInputDouble()

    override var buttonX: GCControllerButtonInput { return _buttonX }
    private var _buttonX = GCControllerButtonInputDouble()

}
