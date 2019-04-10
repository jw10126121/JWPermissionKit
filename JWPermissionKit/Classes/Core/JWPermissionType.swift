//
//  JWPermissionType.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

import Foundation

/// 权限类型协议
public protocol JWPermissionTypeProtocol {
    
    /// 授权状态回调
    typealias StatusCallback = (JWPermissionStatus) -> Void
    
    var type: JWPermissionType { get }
    
    /// 权限状态
    var status: JWPermissionStatus { get }
    
    /// 请求权限
    func requestPermission(_ callback: @escaping StatusCallback)
    
}

/// 授权类型
public enum JWPermissionType {
    
    case none
    
    #if JW_PERMISSION_PHOTOS
    /// 读取相册权限
    case photos
    #endif
    
    #if JW_PERMISSION_MICROPHONE
    /// 读取麦克风权限
    case microphone
    #endif
    
    #if JW_PERMISSION_CAMERA
    /// 摄像头
    case camera
    #endif
    
    
}

extension JWPermissionType: CustomStringConvertible {
    
    /// 描述，用于弹窗提示用户权限类型
    public var description: String {
        switch self {
            
        case .none:         return ""
            #if JW_PERMISSION_PHOTOS
            /// 读取相册权限
        case .photos:       return "相册"
            #endif
            
            #if JW_PERMISSION_MICROPHONE
            /// 读取麦克风权限
        case .microphone:   return "麦克风"
            #endif
            
            #if JW_PERMISSION_CAMERA
            /// 摄像头
        case .camera:       return "摄像头"
            #endif
            
//            #if swift(>=5.0)
//        @unknown default:   return ""
//            #endif

        }
    }
    
    /// info.plist设置的文本
    public var infoKey: String {
        switch self {
            
            case .none:         return ""

            #if JW_PERMISSION_PHOTOS
            /// 读取相册权限
            case .photos:       return "NSPhotoLibraryUsageDescription"
            #endif
            
            #if JW_PERMISSION_MICROPHONE
            /// 读取麦克风权限
            case .microphone:   return "NSMicrophoneUsageDescription"
            #endif
            
            #if JW_PERMISSION_CAMERA
            /// 摄像头
            case .camera:       return "NSCameraUsageDescription"
            #endif
            
//            #if swift(>=5.0)
//            @unknown default:   return ""
//            #endif
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
