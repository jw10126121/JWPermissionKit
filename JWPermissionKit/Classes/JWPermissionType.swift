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
    
    /// 摄像头
    
}

extension JWPermissionType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .microphone:
            return "麦克风"
            #if swift(>=5.0)
        @unknown default: break
            #endif
        }
    }
    
    public var infoKey: String {
        switch self {
        case .microphone:
            return "NSMicrophoneUsageDescription"
            #if swift(>=5.0)
        @unknown default: break
            #endif
        }
    }
    
}

//internal extension String {
//
//    static let photoLibraryUsageDescription      = "NSPhotoLibraryUsageDescription"
//    static let cameraUsageDescription            = "NSCameraUsageDescription"
//    static let requestedNotifications            = "permission.requestedNotifications"
//    static let microphoneUsageDescription        = "NSMicrophoneUsageDescription"
//
//}
