//
//  JWPermission.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

import Foundation


/// 授权管理
public class JWPermission: NSObject {

    /// 授权状态回调
    public typealias StatusCallback = (JWPermissionStatus) -> Void

    /// 麦克风权限单例
    public static let microphone = JWPermission(type: .microphone)

    /// 当前授权类型
    public let type: JWPermissionType
    init(type: JWPermissionType) {
        self.type = type
    }
    
    /// 当前状态
    open var status: JWPermissionStatus {
        
        switch type {
            /// 读取麦克风权限
            case .microphone:   return statusMicrophone
        }
        fatalError()
    }
    
    var statusHandle: StatusCallback?
    /// 请求授权并回调状态
    open func request(_ callback: @escaping StatusCallback) {
        
        /// 保存回调
        self.statusHandle = callback
        
        /// 授权开始
        DispatchQueue.main.async {
//            self.permissionSets.forEach { $0.willRequestPermission(self) }
        }
        
        /// 当前状态
        let status = self.status
        
        switch status {
            /// 已授权，直接回调
            case .authorized:
                callbacks(status)
                break
            /// 用户拒绝
            case .denied:
                // 弹出请求框
                break
            case .disabled:
                break
            case .notDetermined:
                break
            #if swift(>=5.0)
            @unknown default: break
            #endif
        }
        
    }
    
    /// 回调
    internal func callbacks(_ with: JWPermissionStatus) {
        DispatchQueue.main.async {
            self.statusHandle?(self.status)
            /// 授权结束
//            self.permissionSets.forEach { $0.didRequestPermission(self) }
        }
    }
    
    /// 请求具体授权
    public func requestAuthorization(_ callback: @escaping StatusCallback) {
        
        switch type {
            case .microphone:
                requestMicrophone(callback)
            break
        }
    }
    
    
}

extension JWPermission {
    
    /// 自我的文本表示
    override open var description: String {
        return type.description
    }
    
    /// 此实例的文本表示,适合于调试
    override open var debugDescription: String {
        return "\(type): \(status)"
    }
    
}


