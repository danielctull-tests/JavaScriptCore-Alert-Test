
import JavaScriptCore
import UIKit

class ViewController: UIViewController {

	@IBOutlet private var input: UITextView?

	@IBAction func run(_ sender: Any) {

		guard
			let script = input?.text
		else {
			return
		}

		let queue = DispatchQueue(label: "JavaScript")
		queue.async {
			let system = System(viewController: self)
			let context = JSContext(system: system)
			context.evaluateScript(script)
		}
	}
}
