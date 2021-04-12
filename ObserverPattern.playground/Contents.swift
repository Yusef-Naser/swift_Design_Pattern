import Foundation
// MARK: - KVO
// 1
@objcMembers public class KVOUser: NSObject {
    // 2
    dynamic var name: String
    // 3
    public init(name: String) {
        self.name = name
    }
}

// 1
print("-- KVO Example -- ")
// 2
let kvoUser = KVOUser(name: "Ray")
// 3
var kvoObserver: NSKeyValueObservation? = kvoUser.observe(\.name, options: [.initial, .new]) {
    (user, change) in
    print("User's name is \(user.name)")
}


//  Here’s what you did:
//  1. You first print "-- KVO Example --" to the console. This simply makes the printout
//  easier to read.
//  2. You create a new variable for kvoUser. Later on, you’ll have another variable called
//  user, so this avoids a naming conflict.
//  3. You declare an instance of NSKeyValueObservation? called kvoObserver. This is the
//  observer object. You get this by calling kvoUser.observe. This is where the KVO
//  magic happens!

// 1
public class Observable<Type> {
    
    public var value: Type {
        // 1
        didSet {
            // 2
            removeNilObserverCallbacks()
            // 3
            notifyCallbacks(value: oldValue, option: .old)
            notifyCallbacks(value: value, option: .new)
        }
    }
    // MARK: - Object Lifecycle
    public init(_ value: Type) {
        self.value = value
    }
    
    // MARK: - Managing Observers
    // 1
    private var callbacks: [Callback] = []
    // 2
    public func addObserver( _ observer: AnyObject, removeIfExists: Bool = true, options: [ObservableOptions] = [.new], closure: @escaping (Type, ObservableOptions) -> Void) {
        // 3
        if removeIfExists {
            removeObserver(observer)
        }
        // 4
        let callback = Callback(observer: observer,
                                options: options,
                                closure: closure)
        callbacks.append(callback)
        // 5
        if options.contains(.initial) {
            closure(value, .initial)
        }
    }
    // 6
    public func removeObserver(_ observer: AnyObject) {
        // 7
        callbacks = callbacks.filter { $0.observer !== observer }
    }
    
    private func removeNilObserverCallbacks() {
        callbacks = callbacks.filter { $0.observer != nil }
    }
    private func notifyCallbacks(value: Type,
                                 option: ObservableOptions) {
        let callbacksToNotify = callbacks.filter {
            $0.options.contains(option)
        }
        callbacksToNotify.forEach { $0.closure(value, option) }
    }
    
    // MARK: - Callback
    // 2
    fileprivate class Callback {
        fileprivate weak var observer: AnyObject?
        fileprivate let options: [ObservableOptions]
        fileprivate let closure: (Type, ObservableOptions) -> Void
        fileprivate init( observer: AnyObject, options: [ObservableOptions],
        closure: @escaping (Type, ObservableOptions) -> Void) {
            self.observer = observer
            self.options = options
            self.closure = closure
        }
    }
}
// MARK: - ObservableOptions
// 3
public struct ObservableOptions: OptionSet {
    public static let initial = ObservableOptions(rawValue: 1 << 0)
    public static let old = ObservableOptions(rawValue: 1 << 1)
    public static let new = ObservableOptions(rawValue: 1 << 2)
    public var rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}



public class User {
public let name: Observable<String>
public init(name: String) {
self.name = Observable(name)
}
}
public class Observer { }

// 1
print("")
print("-- Observable Example--")
// 2
let user = User(name: "Madeline")
// 3
var observer: Observer? = Observer()
user.name.addObserver(observer!,
options: [.initial, .new]) {
name, change in
print("User's name is \(name)")
}
