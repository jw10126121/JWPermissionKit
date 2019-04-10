//
//  JWPermissionKit+RxSwift.swift
//  JWPermissionKit
//
//  Created by linjw on 2019/4/10.
//

import UIKit
import RxSwift
//import RxCocoa


// MARK: - TWPermission
extension Reactive where Base: JWPermission {
    

    public func permission(_ isRequest: Bool = true) -> Observable<JWPermissionStatus> {
        
        guard isRequest else { return Observable.just(self.base.status) }
        
        return Observable.create { (observer) in

            self.base.request {
                observer.onNext($0)
            }
            return Disposables.create { observer.onCompleted() }
        }
        
    }
    
    
}
