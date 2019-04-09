//
//  JWPermissionAlert.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

import UIKit

/// 授权确认提示框
open class JWPermissionAlert {
    
    /// 权限管理类
    fileprivate let permission: JWPermission
    /// 授权状态
    fileprivate var status: JWPermissionStatus { return permission.status }
    /// 授权权限类型
    fileprivate var type: JWPermissionType { return permission.type }
    
    init(permission: JWPermission) {
        self.permission = permission
    }
    
    
    
    
}



