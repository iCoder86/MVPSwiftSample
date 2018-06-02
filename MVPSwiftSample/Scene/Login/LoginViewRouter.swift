//
//  LoginViewRouter.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import UIKit

protocol LoginViewRouter: ViewRouter {
    func showVerifyView(verifyPresenterDelegate: VerifyPresenterDelegate)
}

class LoginViewRouterImplementation: LoginViewRouter {
    
    fileprivate weak var verifyPresenterDelegate: VerifyPresenterDelegate?
    fileprivate weak var loginViewController: LoginViewController?
    
    init(loginViewController: LoginViewController) {
        self.loginViewController = loginViewController
    }
    
    func showVerifyView(verifyPresenterDelegate: VerifyPresenterDelegate) {
        self.verifyPresenterDelegate = verifyPresenterDelegate
        loginViewController?.performSegue(withIdentifier: "VerifyViewController", sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addBookViewController = segue.destination as? VerifyViewController {
            addBookViewController.configurator = VerifyConfiguratorImplementation(verifyPresenterDelegate: verifyPresenterDelegate)
            
        }
    }
}
