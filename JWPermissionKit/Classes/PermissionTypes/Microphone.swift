//
//  Microphone.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

import AVFoundation
import AudioToolbox

// 麦克风权限分类
extension JWPermission {
    
    /// 读取当前麦克风权限
    var statusMicrophone: JWPermissionStatus {
        
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
        
        switch status {
            case .authorized:          return .authorized
            case .denied, .restricted: return .denied
            case .notDetermined:       return .notDetermined
        }
    }
    
    /// 请求获取麦克风权限
    func requestMicrophone(_ callback: @escaping StatusCallback) {
        
        guard let _ = Bundle.main.object(forInfoDictionaryKey: JWPermissionType.microphone.infoKey) else {
            print("WARNING: \(JWPermissionType.microphone.infoKey) not found in Info.plist")
            return
        }
        
        AVCaptureDevice.requestAccess(for: AVMediaType.audio) { _ in
            callback(self.statusMicrophone)
        }
        
    }
    
}
