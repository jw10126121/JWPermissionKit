//
//  JWPermissionType.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

import Foundation

/// 授权类型
public enum JWPermissionType {
    
    /// 麦克风
    case microphone
    
}

extension JWPermissionType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .microphone:
            return "麦克风"
        }
    }
    
}
