
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

		let semaphore = DispatchSemaphore(value: 0)
		var confirmation = false
		let string = String(describing: title)

		DispatchQueue.main.async {

			let alert = UIAlertController(title: string, message: nil, preferredStyle: .alert)

			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
				confirmation = true
				semaphore.signal()
			}))

			alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
				semaphore.signal()
			}))

			self.viewController?.present(alert, animated: true, completion: nil)
		}

		semaphore.wait()

		print("Confirm: \(confirmation)!")
		return confirmation
	}
}
