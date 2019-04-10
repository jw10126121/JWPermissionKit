//
//  JWPhoto.swift
//  JWPermissionKit
//
//  Created by linjw on 2019/4/10.
//

#if JW_PERMISSION_PHOTOS
import Photos

// 相册权限相关
extension JWPermission {
    
    /// 获取状态
    var statusPhotos: JWPermissionStatus {
        return PHPhotoLibrary.authorizationStatus().permissionStatus
    }
    
    /// 请求状态
    func requestPhotos(_ callback: @escaping JWPermissionTypeProtocol.StatusCallback) {
        
        guard Bundle.main.object(forInfoDictionaryKey: JWPermissionType.photos.infoKey) != nil else {
            print("WARNING: \(JWPermissionType.photos.infoKey) not found in Info.plist")
            callback(.disabled)
            return
        }

        PHPhotoLibrary.requestAuthorization { _ in
            callback(self.statusPhotos)
        }
        
    }
    
    
}

fileprivate extension PHAuthorizationStatus {
    
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


