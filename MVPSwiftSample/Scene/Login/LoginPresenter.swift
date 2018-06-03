//
//  LoginPresenter.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import Foundation

protocol LoginView: class {
    func updateViewOnSuccessVerify()
    func updateViewOnFailVerify()
}

protocol LoginPresenterDelegate: class {
    func loginPresenterSuccess()
    func loginPresenterFail()
}

protocol LoginPresenter {
    var router: LoginViewRouter { get }
    func loginButtonPressed(loginParameter: LoginParamters)
}

class LoginPresenterImplementation: LoginPresenter,VerifyPresenterDelegate {
    fileprivate weak var view: LoginView?
    internal let router: LoginViewRouter
    
    init(view:LoginView, router: LoginViewRouter) {
        self.view = view
        self.router = router
    }

    func loginButtonPressed(loginParameter: LoginParamters) {
        router.showVerifyView(loginParameter: loginParameter, verifyPresenterDelegate: self)
    }
    
    // MARK: - VerifyPresenterDelegate
    
    func verifySuccess() {
        view?.updateViewOnSuccessVerify()
    }
    
    func verifyFail() {
        view?.updateViewOnFailVerify()
    }
}

