import GameController
@testable import UnderControl

class GCControllerButtonInputDouble: GCControllerButtonInput {

    override var pressedChangedHandler: GCControllerButtonValueChangedHandler? {
        get { return _pressedChangedHandler }
        set { _pressedChangedHandler = newValue }
    }
    private var _pressedChangedHandler: GCControllerButtonValueChangedHandler?

    override var valueChangedHandler: GCControllerButtonValueChangedHandler? {
        get { return _valueChangedHandler }
        set { _valueChangedHandler = newValue }
    }
    private var _valueChangedHandler: GCControllerButtonValueChangedHandler?

}
