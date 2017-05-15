import Quick
import Nimble
@testable import UnderControl

class ControllersSpec: QuickSpec {

    override func spec() {
        describe("Controllers") {
            var controllers: Controllers!

            beforeEach {
                controllers = Controllers()
            }

            afterEach {
                controllers = nil
            }
        }
    }

}
