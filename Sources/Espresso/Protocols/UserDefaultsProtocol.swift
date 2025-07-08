//
//  UserDefaultsProtocol.swift
//  Espresso
//
//  Created by Mitch Treece on 6/28/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

public import Foundation

/// Protocol describing something that interacts with user defaults.
public protocol UserDefaultsProtocol: Sendable {
    
    /// Blocks the calling thread until all in-progress set operations have completed.
    /// Generally, you should _not_ call this.
    /// - returns: A flag indicating if synchronization was successful or not.
    @discardableResult
    func synchronize() -> Bool
    
    /// Gets a value for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `nil`.
    func value(forKey key: String) -> Any?
    
    /// Gets a `Bool` for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `false`.
    func bool(forKey key: String) -> Bool
    
    /// Gets an `Int` for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `0`.
    func integer(forKey key: String) -> Int
    
    /// Gets a `Float` for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `0`.
    func float(forKey key: String) -> Float
    
    /// Gets a `Double` for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `0`.
    func double(forKey key: String) -> Double
    
    /// Gets a `String` for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `nil`.
    func string(forKey key: String) -> String?
    
    /// Gets a `String` array for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `nil`.
    func stringArray(forKey key: String) -> [String]?
    
    /// Gets `Data` for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `nil`.
    func data(forKey key: String) -> Data?
    
    /// Gets a `URL` for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `nil`.
    func url(forKey key: String) -> URL?
    
    /// Gets an `Array` for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `nil`.
    func array(forKey key: String) -> [Any]?
    
    /// Gets a `Dictionary` for a given key.
    /// - parameter key: The key.
    /// - returns: The key's value, or `nil`.
    func dictionary(forKey key: String) -> [String: Any]?
    
    /// Sets a value for a given key.
    /// - parameter value: The value.
    /// - parameter key: The key.
    func set(
        _ value: Any?,
        forKey key: String
    )
    
    /// Removes a value for a given key.
    /// - parameter key: The key.
    func removeObject(forKey key: String)

    /// Gets a dictionary representation of the search list entry specified by 'domainName',
    /// the current user, and any host.
    /// - parameter domainName: The domain name.
    /// - returns: The domain's persistent dictionary, or `nil`.
    func persistentDomain(forName domainName: String) -> [String: Any]?
    
    /// Replaces all values in the search list entry specified by 'domainName',
    /// the current user, and any host, with the values in 'domain'.
    /// - parameter domain: The domain's persistent dictionary.
    /// - parameter domainName: The domain name.
    func setPersistentDomain(
        _ domain: [String: Any],
        forName domainName: String
    )
    
    /// Removes all values from the search list entry specified by 'domainName',
    /// the current user, and any host.
    /// - parameter domainName: The domain name.
    func removePersistentDomain(forName domainName: String)
    
}

extension UserDefaults: UserDefaultsProtocol, @retroactive @unchecked Sendable {}
