//
//  JWCamera.swift
//  JWPermissionKit
//
//  Created by linjw on 2019/4/10.
//

#if JW_PERMISSION_CAMERA
import AVFoundation

/// 摄像头权限相关
internal extension JWPermission {
    
    /// 摄像头权限
    var statusCamera: JWPermissionStatus {
        return AVCaptureDevice.authorizationStatus(for: AVMediaType.video).permissionStatus
    }

    
    func requestCamera(_ callback: @escaping JWPermissionTypeProtocol.StatusCallback) {
        guard let _ = Bundle.main.object(forInfoDictionaryKey: JWPermissionType.camera.infoKey) else {
            print("WARNING: \(JWPermissionType.camera.infoKey) not found in Info.plist")
            callback(.disabled)
            return
        }

        AVCaptureDevice.requestAccess(for: AVMediaType.video) { _ in
            callback(self.statusCamera)
        }
    }
}

fileprivate extension AVAuthorizationStatus {
    
    var permissionStatus: JWPermissionStatus {
        switch self {
        case .authorized:          return .authorized
        case .denied:              return .denied
        case .restricted:          return .disabled
        case .notDetermined:       return .notDetermined
        #if swift(<5.0)
        default:               return .notDetermined
        #else
        @unknown default:      return .notDetermined
        #endif
        }
    }
    
}


/// 摄像头权限相关
fileprivate final class JWCamera: JWPermissionTypeProtocol {
    
    /// 类型
    public var type: JWPermissionType { return .camera }
    
    /// 权限状态
    public var status: JWPermissionStatus {
        return AVCaptureDevice.authorizationStatus(for: AVMediaType.video).permissionStatus
    }
    
    /// 请求权限
    public func requestPermission(_ callback: @escaping StatusCallback) {
        guard let _ = Bundle.main.object(forInfoDictionaryKey: JWPermissionType.camera.infoKey) else {
            print("WARNING: \(JWPermissionType.camera.infoKey) not found in Info.plist")
            callback(.disabled)
            return
        }
        
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { _ in
            callback(self.status)
        }
    }
}


#endif

