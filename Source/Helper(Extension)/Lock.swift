//
//  Lock.swift
//  demo
//
//  Created by Jesse on 2019/2/16.
//  Copyright © 2019 Jesse. All rights reserved.
//

import Foundation

/// A simple way like objective-c's using
///
/// - Parameters:
///   - lock: lock object
///   - closure: closure
func synchronized(lock: AnyObject, closure: () -> ()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}

public protocol Lock {
    func lock()
    func unlock()
}

extension NSLock: Lock {}

public final class Mutex: Lock {
    private var mutex: pthread_mutex_t = {
        var mutex = pthread_mutex_t()
        pthread_mutex_init(&mutex, nil)
        return mutex
    }()
    
    public func lock() {
        pthread_mutex_lock(&mutex)
    }
    
    public func unlock() {
        pthread_mutex_unlock(&mutex)
    }
}

//  causes a thread trying to acquire a lock to wait in a loop while checking if the lock is available. It is efficient if waiting is rare, but wasteful if waiting is common.
@available(iOS 10.0, *)
public final class SpinLock: Lock {
    private var unfairLock = os_unfair_lock_s()
    
    public func lock() {
        os_unfair_lock_lock(&unfairLock)
    }
    
    public func unlock() {
        os_unfair_lock_unlock(&unfairLock)
    }
}
