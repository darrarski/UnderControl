import GameController
@testable import UnderControl

class GCGamepadDouble: GCGamepad {

    override var valueChangedHandler: GCGamepadValueChangedHandler? {
        get { return _valueChangedHandler }
        set { _valueChangedHandler = newValue }
    }
    private var _valueChangedHandler: GCGamepadValueChangedHandler?

    override var buttonA: GCControllerButtonInput { return _buttonA }
    private var _buttonA = GCControllerButtonInputDouble()

    override var buttonB: GCControllerButtonInput { return _buttonB }
    private var _buttonB = GCControllerButtonInputDouble()

    override var buttonX: GCControllerButtonInput { return _buttonX }
    private var _buttonX = GCControllerButtonInputDouble()

    override var buttonY: GCControllerButtonInput { return _buttonY }
    private var _buttonY = GCControllerButtonInputDouble()

}
