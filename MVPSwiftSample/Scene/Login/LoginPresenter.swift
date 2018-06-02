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
    func loginButtonPressed(paramter: LoginParamters)
}

class LoginPresenterImplementation: LoginPresenter,VerifyPresenterDelegate {
    fileprivate weak var view: LoginView?
    internal let router: LoginViewRouter
    
    init(view:LoginView, router: LoginViewRouter) {
        self.view = view
        self.router = router
    }

    func loginButtonPressed(paramter: LoginParamters) {
        print("Login Mobile Number: \(paramter.loginMobileNumber)")
        router.showVerifyView(verifyPresenterDelegate: self)
    }
    
    // MARK: - VerifyPresenterDelegate
    
    func verifySuccess() {
        print("verifySuccess")
        view?.updateViewOnSuccessVerify()
    }
    
    func verifyFail() {
        print("verifyFail")
        view?.updateViewOnFailVerify()
    }

}

