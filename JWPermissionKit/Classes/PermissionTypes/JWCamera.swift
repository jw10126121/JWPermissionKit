//
//  JWCamera.swift
//  JWPermissionKit
//
//  Created by linjw on 2019/4/10.
//

import AVFoundation

internal extension JWPermission {
    
    var statusCamera: JWPermissionStatus {
        
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        
        switch status {
            case .authorized:          return .authorized
            case .denied:              return .denied
            case .restricted:          return .disabled
            case .notDetermined:       return .notDetermined
        }
    }
    
//    func requestCamera(_ callback: @escaping StatusCallback) {
//        guard let _ = Bundle.main.object(forInfoDictionaryKey: .cameraUsageDescription) else {
//            print("WARNING: \(String.cameraUsageDescription) not found in Info.plist")
//            return
//        }
//
//        AVCaptureDevice.requestAccess(for: AVMediaType.video) { _ in
//            callback(self.statusCamera)
//        }
//    }
}

