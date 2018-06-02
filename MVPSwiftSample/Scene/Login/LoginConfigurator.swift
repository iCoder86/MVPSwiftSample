//
//  LoginConfigurator.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import Foundation

protocol LoginConfigurator {
    func configure(loginViewController: LoginViewController)
}

class LoginConfiguratorImplementation: LoginConfigurator {
    
    func configure(loginViewController: LoginViewController) {
        let router = LoginViewRouterImplementation(loginViewController: loginViewController)
        let presenter = LoginPresenterImplementation(view: loginViewController, router: router)
        
        loginViewController.presenter = presenter
    }
}
