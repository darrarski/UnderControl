import GameController
@testable import UnderControl

class GCControllerDirectionPadDouble: GCControllerDirectionPad {

    override var xAxis: GCControllerAxisInput { return _xAxis }
    private var _xAxis = GCControllerAxisInputDouble()

    override var yAxis: GCControllerAxisInput { return _yAxis }
    private var _yAxis = GCControllerAxisInputDouble()

    override var up: GCControllerButtonInput { return _up }
    private var _up = GCControllerButtonInputDouble()

    override var down: GCControllerButtonInput { return _down }
    private var _down = GCControllerButtonInputDouble()

    override var left: GCControllerButtonInput { return _left }
    private var _left = GCControllerButtonInputDouble()

    override var right: GCControllerButtonInput { return _right }
    private var _right = GCControllerButtonInputDouble()

    override var valueChangedHandler: GCControllerDirectionPadValueChangedHandler? {
        get { return _valueChangedHandler }
        set { _valueChangedHandler = newValue }
    }
    private var _valueChangedHandler: GCControllerDirectionPadValueChangedHandler?

}
