//
//  String.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 7/5/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

public extension String {
    
    init?(UTF8Data: Data) {
        
        let data = UTF8Data
        
        var string = ""
        
        var generator = data.byteValue.makeIterator()
        
        var encoding = UTF8()
                
        repeat {
        
            switch encoding.decode(&generator) {
                
            case let .scalarValue(scalar):
                
                string.append(scalar)
                
            case .emptyInput:
                
                self = string
                
                return
                
            case .error:
                
                return nil
            }
            
        } while true
        
        return nil
    }
    
    func toUTF8Data() -> Data {
        
        return Data(byteValue: [] + utf8)
    }
}