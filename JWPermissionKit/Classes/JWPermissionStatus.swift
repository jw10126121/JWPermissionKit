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
    /// 禁用(此应用程序没有被授权访问,可能是家长控制权限)
    case disabled
    /// 未知，首次申请权限
    case notDetermined
}

/// 授权状态描述
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
            return "未申请权限"
            #if swift(>=5.0)
        @unknown default: break
            #endif
        }
    }
    
}
