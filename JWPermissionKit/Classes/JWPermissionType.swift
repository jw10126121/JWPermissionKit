//
//  JWPermissionType.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

import Foundation



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
