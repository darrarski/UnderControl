import GameController
@testable import UnderControl

class GCControllerAxisInputDouble: GCControllerAxisInput {

    override var valueChangedHandler: GCControllerAxisValueChangedHandler? {
        get { return _valueChangedHandler }
        set { _valueChangedHandler = newValue }
    }
    private var _valueChangedHandler: GCControllerAxisValueChangedHandler?

}
