import GameController

public protocol GCGamepadType: class {
    var valueChangedHandler: GCGamepadValueChangedHandler? { get set }
}

extension GCGamepad: GCGamepadType {}
