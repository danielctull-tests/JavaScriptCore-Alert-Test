
import JavaScriptCore
import UIKit

@objc public protocol JSSystem: JSExport {
	func confirm(_ title: JSValue) -> Bool
}

class System: NSObject {

	weak var viewController: UIViewController?
	init(viewController: UIViewController) {
		self.viewController = viewController
	}
}

extension System: JSSystem {

	func confirm(_ title: JSValue) -> Bool {
		print("CONFIRMING!")
		return true
	}
}
