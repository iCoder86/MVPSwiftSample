//
//  LoginViewRouter.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import UIKit

protocol LoginViewRouter: ViewRouter {
    func showVerifyView(loginParameter: LoginParamters, verifyPresenterDelegate: VerifyPresenterDelegate)
}

class LoginViewRouterImplementation: LoginViewRouter {
    fileprivate weak var loginViewController: LoginViewController?
    
    fileprivate weak var verifyPresenterDelegate: VerifyPresenterDelegate?
    fileprivate var loginParameter : LoginParamters!
    
    init(loginViewController: LoginViewController) {
        self.loginViewController = loginViewController
    }
    
    func showVerifyView(loginParameter: LoginParamters ,verifyPresenterDelegate: VerifyPresenterDelegate) {
        self.verifyPresenterDelegate = verifyPresenterDelegate
        self.loginParameter = loginParameter
        loginViewController?.performSegue(withIdentifier: "VerifyViewController", sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let verifyViewController = segue.destination as? VerifyViewController {
            verifyViewController.configurator = VerifyConfiguratorImplementation(loginParameter: loginParameter, verifyPresenterDelegate: verifyPresenterDelegate!)
        }
    }
}
