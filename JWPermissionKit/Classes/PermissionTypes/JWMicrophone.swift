//
//  Microphone.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

#if JW_PERMISSION_MICROPHONE
import AVFoundation
import AudioToolbox

// 麦克风权限分类
extension JWPermission {
    
    /// 读取当前麦克风权限
    var statusMicrophone: JWPermissionStatus {
        return AVCaptureDevice.authorizationStatus(for: AVMediaType.audio).permissionStatus
    }
    
    /// 请求获取麦克风权限
    func requestMicrophone(_ callback: @escaping StatusCallback) {
        
        guard let _ = Bundle.main.object(forInfoDictionaryKey: JWPermissionType.microphone.infoKey) else {
            print("WARNING: \(JWPermissionType.microphone.infoKey) not found in Info.plist")
            callback(.disabled)
            return
        }
        
        AVCaptureDevice.requestAccess(for: AVMediaType.audio) { _ in
            callback(self.statusMicrophone)
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
#endif
