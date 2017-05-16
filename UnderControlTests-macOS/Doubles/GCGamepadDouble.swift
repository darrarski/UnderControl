import GameController
@testable import UnderControl

class GCGamepadDouble: GCGamepad {

    override var valueChangedHandler: GCGamepadValueChangedHandler? {
        get { return _valueChangedHandler }
        set { _valueChangedHandler = newValue }
    }

    private var _valueChangedHandler: GCGamepadValueChangedHandler?

}
