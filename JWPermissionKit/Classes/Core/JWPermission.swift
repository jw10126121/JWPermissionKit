//
//  JWPermission.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

import Foundation

/// 授权管理
public class JWPermission: NSObject {
    
//    /// 单例，必须配合configPermission方法使用
//    public static let shared: JWPermission = JWPermission()
    

    #if JW_PERMISSION_CAMERA
    /// 摄像头权限单例
    public static let camera = JWPermission(type: .camera)
    #endif
    
    #if JW_PERMISSION_MICROPHONE
    /// 麦克风权限单例
    public static let microphone = JWPermission(type: .microphone)
    #endif
    
    #if JW_PERMISSION_PHOTOS
    /// 相册权限单例
    public static let photos = JWPermission(type: .photos)
    #endif
    
    /// 当前授权类型
    public var type: JWPermissionType
    init(type: JWPermissionType) {
        self.type = type
    }
    
    /// 当前状态
    open var status: JWPermissionStatus {
        
        switch type {
            
            case .none:         return .authorized
            
            #if JW_PERMISSION_PHOTOS
            /// 读取相册权限
            case .photos:       return statusPhotos
            #endif
            
            #if JW_PERMISSION_MICROPHONE
            /// 读取麦克风权限
            case .microphone:   return statusMicrophone
            #endif

            #if JW_PERMISSION_CAMERA
            /// 摄像头
            case .camera:       return statusCamera
            #endif
        
        }
    }
    
    // ---- 弹窗设置 ----
    
    /// 用户未授权过时弹自定义授权对话框
    public var isPresentPermissionAlert: Bool = false
    
    
    /// 是否 用户拒绝后弹自定义授权对话框
    public var isPresentDeniedAlert: Bool = true
    /// 用户拒绝后弹自定义授权对话框
    open lazy var alertForUserDenied: JWPermissionDeniedAlert = {
        return JWPermissionDeniedAlert(permission: self)
    }()
    
    /// 是否 用户权限被禁用后 弹 自定义授权对话框
    public var isPresentDisabledAlert: Bool = true
    /// 用户权限被禁用后 弹 自定义授权对话框
    open lazy var alertForDisabled: JWPermissionDisabledAlert = {
        return JWPermissionDisabledAlert(permission: self)
    }()
    
    
    private var statusHandle: JWPermissionTypeProtocol.StatusCallback?
    /// 请求授权并回调状态
    open func request(_ callback: @escaping JWPermissionTypeProtocol.StatusCallback) {
        
        /// 保存回调
        self.statusHandle = callback
        
        /// 当前状态
        let status = self.status
        
        switch status {
            /// 已授权，直接回调
            case .authorized:    callbacks(status)
            /// 用户拒绝
            case .denied:        isPresentDeniedAlert ? alertForUserDenied.alert() : callbacks(status)
            /// 被禁用
            case .disabled:      isPresentDisabledAlert ? alertForDisabled.alert() : callbacks(status)
            /// 未使用授权
            case .notDetermined: isPresentPermissionAlert ? () : requestAuthorization(callbacks)
//            #if swift(>=5.0)
//            @unknown default: break
//            #endif
        }
        
    }
    
    /// 回调
    internal func callbacks(_ with: JWPermissionStatus) {
        DispatchQueue.main.async {
            self.statusHandle?(self.status)
        }
    }
    
    /// 请求具体授权
    fileprivate func requestAuthorization(_ callback: @escaping JWPermissionTypeProtocol.StatusCallback) {
        
        switch type {
            
        case .none:         ()

            #if JW_PERMISSION_PHOTOS
            /// 读取相册权限
        case .photos:       requestPhotos(callback)
            #endif
            
            #if JW_PERMISSION_MICROPHONE
            /// 读取麦克风权限
        case .microphone:   requestMicrophone(callback)
            #endif
            
            #if JW_PERMISSION_CAMERA
            /// 摄像头
        case .camera:       requestCamera(callback)
            #endif

//            #if swift(>=5.0)
//            @unknown default: break
//            #endif
        }
    }
    
    
}

extension JWPermission {
    
    /// 描述文本
    override open var description: String {
        return type.description
    }
    
    /// 调试描述文本
    override open var debugDescription: String {
        return "\(type): \(status)"
    }
    
}


