
import JavaScriptCore

extension JSContext {

	public convenience init(system: JSSystem) {
		self.init()
		self.system = system
	}

	var system: JSSystem? {
		get { return object(for: "system") as? JSSystem }
		set { setObject(newValue, for: "system") }
	}

	// MARK:- Convenient access to types

	func object(for name: String) -> Any? {
		return objectForKeyedSubscript(name).toObject()
	}

	func setObject(_ type: Any?, for name: String) {
		setObject(type, forKeyedSubscript: name as (NSCopying & NSObjectProtocol)!)
	}
}
