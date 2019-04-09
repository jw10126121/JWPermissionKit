//
//  JWPermissionStatus.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

import Foundation

/// 授权状态类型
public enum JWPermissionStatus: Int {
    /// 授权了
    case authorized
    /// 用户拒绝
    case denied
    /// 禁用
    case disabled
    /// 用户尚未做出选择这个应用程序的问候
    case notDetermined
}

/// 描述
extension JWPermissionStatus: CustomStringConvertible {
    
    /// 描述
    public var description: String {
        switch self {
        case .authorized:
            return "授权"
        case .denied:
            return "用户拒绝"
        case .disabled:
            return "禁用"
        case .notDetermined:
            return "用户尚未做出选择这个应用程序的问候"
        }
    }
    
}
