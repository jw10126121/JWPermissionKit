//
//  JWPermissionAlert.swift
//  JWPermissionKit
//
//  Created by LjwMac on 2019/4/9.
//

import UIKit

/// 授权确认提示框基类
open class JWPermissionAlert {
    
    /// 标题
    open var title: String?
    /// 描述文字
    open var message: String?
    /// 取消按钮文字
    open var cancelText: String? {
        get { return cancelActionTitle }
        set { cancelActionTitle = newValue }
    }
    /// 确定按钮文字
    open var confirmText: String?  {
        get { return defaultActionTitle }
        set { defaultActionTitle = newValue }
    }
    
    fileprivate var cancelActionTitle: String? = "取消"
    fileprivate var defaultActionTitle: String? = "确定"
    
    /// 权限管理类
    fileprivate let permission: JWPermission
    /// 授权状态
    fileprivate var status: JWPermissionStatus { return permission.status }
    /// 授权权限类型
    fileprivate var type: JWPermissionType { return permission.type }
    
    init(permission: JWPermission) {
        self.permission = permission
    }
    
    /// 弹窗
    func alert() {
        DispatchQueue.main.async {
            UIApplication.shared.presentViewController(self.alertView)
        }
    }
    
    /// 弹窗对象
    var alertView: UIAlertController {
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: cancelActionTitle, style: .cancel, handler: cancelHandler)
        controller.addAction(action)
        
        return controller
        
    }
    
    fileprivate var callbacks: JWPermission.StatusCallback { return permission.callbacks }
    fileprivate func cancelHandler(_ action: UIAlertAction) { callbacks(status) }
    
}

/// 用户拒绝后弹窗提醒跳转到手机设置页面进行权限设置
public class JWPermissionDeniedAlert: JWPermissionAlert {
    
    override var alertView: UIAlertController {
        let controller = super.alertView
        
        let action = UIAlertAction(title: defaultActionTitle, style: .default, handler: settingsHandler)
        controller.addAction(action)
        
        if #available(iOS 9.0, *) {
            controller.preferredAction = action
        }
        
        return controller
    }
    
    override init(permission: JWPermission) {
        super.init(permission: permission)
        
        title        = "没有启用\(permission)权限"
        message      = "请在设置应用程序中启用\(permission)访问"
        cancelText   = "取消"
        confirmText  = "设置"
    }
    
    private func settingsHandler(_ action: UIAlertAction) {
        
        NotificationCenter.default.addObserver(self,
                                               selector: Selector.settingsHandler,
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        
        /// 跳转到app设置
        if let URL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.openURL(URL)
        }
        
    }
    
    @objc func settingsHandler() {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        callbacks(status)
    }
    
}

/// 用户权限被禁用后 弹窗提醒跳转到手机设置页面进行权限设置
public class JWPermissionDisabledAlert: JWPermissionAlert {
    
    override init(permission: JWPermission) {
        super.init(permission: permission)
        
        title        = "没有启用\(permission)权限"
        message      = "您没有权限访问\(permission)"
        cancelText   = "好的"
    }
    
}

fileprivate extension Selector {
//    static let tapped = #selector(TWPermissionButton.tapped(_:))
//    static let highlight = #selector(TWPermissionButton.highlight(_:))
    static let settingsHandler = #selector(JWPermissionDeniedAlert.settingsHandler)
}


/// 弹对话框
fileprivate extension UIApplication {
    
    var topViewController: UIViewController? {
        var vc = delegate?.window??.rootViewController
        
        while let presentedVC = vc?.presentedViewController {
            vc = presentedVC
        }
        
        return vc
    }
    
    func presentViewController(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        topViewController?.present(viewController, animated: animated, completion: completion)
    }
    
}


