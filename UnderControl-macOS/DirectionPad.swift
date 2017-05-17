import GameController

public class DirectionPad {

    public init(gcDirectionPad: GCControllerDirectionPad) {
        self.gcDirectionPad = gcDirectionPad
        up = Button(gcButton: gcDirectionPad.up)
        down = Button(gcButton: gcDirectionPad.down)
        left = Button(gcButton: gcDirectionPad.left)
        right = Button(gcButton: gcDirectionPad.right)
    }

    public let gcDirectionPad: GCControllerDirectionPad

    public let up: Button
    public let down: Button
    public let left: Button
    public let right: Button

}
