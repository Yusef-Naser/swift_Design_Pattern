import UIKit
// MARK: - Singleton
let app = UIApplication.shared

public class MySingleton {
    // 1
    static let shared = MySingleton()
    // 2
    private init() { }
}
// 3
let mySingleton = MySingleton.shared


public class MySingletonPlus {
    // 1
    static let shared = MySingletonPlus()
    // 2
    public init() { }
}
// 3
let singletonPlus = MySingletonPlus.shared
// 4
let singletonPlus2 = MySingletonPlus()
