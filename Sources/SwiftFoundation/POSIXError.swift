//
//  POSIXError.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 7/22/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

#if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
    import Darwin.C
#elseif os(Linux)
    import Glibc
#endif

public extension POSIXError {

    /// Creates error from C ```errno```.
    static var fromErrorNumber: POSIXError? { return self.init(rawValue: errno) }
}
#if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
/// Enumeration describing POSIX error codes.
public enum POSIXError: ErrorType, RawRepresentable {

    case Value(CInt)

    public init?(rawValue: CInt) {

        self = .Value(rawValue)
    }

    public var rawValue: CInt {

        switch self {

        case let .Value(rawValue): return rawValue
        }
    }
}

#endif
#if os(Linux)

    /// Enumeration describing POSIX error codes.
    public enum POSIXError: ErrorType, RawRepresentable {

        case Value(CInt)

        public init?(rawValue: CInt) {

            self = .Value(rawValue)
        }

        public var rawValue: CInt {

            switch self {

            case let .Value(rawValue): return rawValue
            }
        }
    }

#endif
