//
//  AppEnvironment.swift
//  Espresso
//
//  Created by Mitch Treece on 6/24/25.
//  Copyright © 2025 Super Epic Studios, LLC.
//

import Foundation

/// Representation of the various application environments.
public enum AppEnvironment: String, Sendable {
    
    /// A development environment.
    case development
    
    /// A testing environment.
    case testing
    
    /// A staging environment.
    case staging
    
    /// An alpha environment.
    case alpha
    
    /// A beta environment.
    case beta
    
    /// A pre-production environment.
    case preproduction
    
    /// A production environment.
    case production
    
    /// The environment's short name.
    public var shortName: String {
                
        switch self {
        case .development: "dev"
        case .testing: "test"
        case .staging: "stg"
        case .alpha: "alpha"
        case .beta: "beta"
        case .preproduction: "preprod"
        case .production: "prod"
        }
        
    }
    
    /// The environment's long name.
    public var longName: String {
        self.rawValue
    }
    
    /// The environment's launch arguments.
    public var arguments: [String] {
        ProcessInfo.processInfo.arguments
    }
    
    /// The environment's variables.
    public var variables: [String: String] {
        ProcessInfo.processInfo.environment
    }
    
    /// Flag indicating if the process is currently attached to a debug session.
    public var isDebugSessionAttached: Bool {
        ProcessInfo.processInfo.isDebugSessionAttached
    }
    
    /// Flag indicating if the environment is `production`.
    public var isProduction: Bool {
        return switch self {
        case .production: true
        default: false
        }
    }
    
    /// Flag indicating if the environment is `testing`.
    public var isTesting: Bool {
        return switch self {
        case .testing: true
        default: false
        }
    }
    
    /// Flag indicating if the environment is `development`.
    public var isDevelopment: Bool {
        return switch self {
        case .development: true
        default: false
        }
    }
        
    /// Flag indicating if the environment is `development`
    /// _or_ `testing`.
    public var isDevelopmentOrTesting: Bool {
        return self.isDevelopment || self.isTesting
    }
    
    /// Flag indicating if the environment is `development`,
    /// `testing`, _or_ connected to a debug session.
    public var isDevelopmentOrTestingOrDebug: Bool {
        return self.isDevelopment || self.isTesting || self.isDebugSessionAttached
    }

    /// Flag indicating if the environment is `development`
    /// _or_ connected to a debug session.
    public var isDevelopmentOrDebug: Bool {
        return self.isDevelopment || self.isDebugSessionAttached
    }
    
    // MARK: Private
    
    private static func environment(from string: String) -> AppEnvironment? {
        
        switch string.lowercased() {
        case "dev",
             "develop",
             "development",
             "debug":

            return .development
            
        case "test",
             "testing",
             "qa",
             "uat":

            return .testing

        case "stg",
             "stage",
             "staging":

            return .staging
            
        case "alpha":
            
            return .alpha
            
        case "beta":
            
            return .beta

        case "pre",
             "preprod",
             "pre_prod",
             "preproduction",
             "pre_production":

            return .preproduction
            
        case "prod",
             "production":
            
            return .production

        default:
            
            return nil
            
        }
        
    }
    
}

// MARK: Natural

extension AppEnvironment {
    
    /// The natural environment.
    ///
    /// The environment is determined using the current process's bundled info plist,
    /// launch arguments, environment variables, & compiler flags. Info plist entries
    /// are evaluated first, followed by launch arguments, environment variables, &
    /// compiler flags. If an environment isn't specified, `production` will be returned.
    ///
    /// An info plist entry can be added using the following key/value format:
    /// `Environment: {e}`, where `{e}` is replaced by your desired environment.
    ///
    /// Launch arguments can be specified using the following format:
    /// `-environment={e}`, where `{e}` is replaced by your desired environment.
    ///
    /// Environment variables can be specified using the following key/value format:
    /// `environment: {e}`, where `{e}` is replaced by your desired environment
    ///
    /// Compiler flags can be specified by adding an entry to your
    /// project's Build Settings → Swift Compiler - Custom Flags →
    /// Active Compilation Conditions.
    ///
    /// Supported environments:
    ///
    /// ```
    /// Development = (DEV, DEVELOP, DEVELOPMENT, DEBUG)
    /// Testing = (TEST, TESTING, QA, UAT)
    /// Staging = (STG, STAGE, STAGING)
    /// Alpha = (ALPHA)
    /// Beta = (BETA)
    /// Pre-Production = (PRE, PREPROD, PRE_PROD, PREPRODUCTION, PRE_PRODUCTION)
    /// Production = (PROD, PRODUCTION)
    /// ```
    ///
    /// **Note**
    ///
    /// Launch arguments & environment variables are stripped out of
    /// packaged builds. These will only work when building directly
    /// from an Xcode scheme.
    ///
    /// Compiler flags are *module* specific. Meaning, if you've integrated this package
    /// using SPM, they cannot be read at compile-time.
    ///
    /// **Adding an info plist entry is the preferred method of specifying an environment.**
    /// This method works when building from Xcode, or when running via a packaged build.
    public static var natural: AppEnvironment {
        
        // Info plist
        
        if let string = Bundle.main.infoDictionary?["Environment"] as? String,
           let env = environment(from: string) {
            
            return env
            
        }
        else if let string = Bundle.main.infoDictionary?["environment"] as? String,
                let env = environment(from: string) {
            
            return env
            
        }
                
        // Environment Variables & Launch Args

        let processInfo = ProcessInfo.processInfo
        var envString: String?
        
        if let envVar = processInfo.environment["environment"] {
            envString = envVar.lowercased()
        }
        
        if let envArg = processInfo.arguments
            .first(where: { $0.contains("-environment=") }) {
            
            let components = envArg
                .replacingOccurrences(of: " ", with: "")
                .components(separatedBy: "=")
            
            if components.count > 1 {
                
                envString = components[1]
                    .lowercased()
                
            }
            
        }
        
        if let string = envString,
           let env = environment(from: string) {
            
            return env
            
        }
        
        // Compiler Flags
                
        #if DEV || DEVELOP || DEVELOPMENT || DEBUG
        return .development
        #elseif TEST || TESTING || QA || UAT
        return .testing
        #elseif STG || STAGE || STAGING
        return .staging
        #elseif ALPHA
        return .alpha
        #elseif BETA
        return .beta
        #elseif PRE || PREPROD || PRE_PROD || PREPRODUCTION || PRE_PRODUCTION
        return .preproduction
        #elseif PROD || PRODUCTION
        return .production
        #else
        return .production
        #endif
        
    }
    
}
