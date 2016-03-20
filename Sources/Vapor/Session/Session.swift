
public class Session {

    public let identifier: String
    var driver: SessionDriver

    public init(driver: SessionDriver) {
        self.identifier = driver.makeSessionIdentifier()
        self.driver = driver
    }

    init(identifier: String, driver: SessionDriver) {
        self.identifier = identifier
        self.driver = driver
	}

	public func destroy() {
        driver.destroy(self)
	}

    public subscript(key: String) -> String? {
        get {
            return driver.valueFor(key: key, inSession: self)
        }

        set {
            driver.set(newValue, forKey: key, inSession: self)
        }
    }
}
