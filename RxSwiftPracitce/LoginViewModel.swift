//
//  LoginViewModel.swift
//  RxSwiftPracitce
//
//  Created by plsystems on 2023/01/16.
//

import Foundation
import RxSwift
import RxRelay

class LoginViewModel {
    
    let emailObserver = BehaviorRelay<String>(value: "")
    let passwordObserver = BehaviorRelay<String>(value: "")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailObserver, passwordObserver)
            .map { email, password in
                return !email.isEmpty && email.contains("@") && email.contains(".") && password.count > 0
            }
    }
}

