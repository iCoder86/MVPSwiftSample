//
//  VerifyConfigurator.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import Foundation

protocol VerifyConfigurator {
    func configure(verifyViewController: VerifyViewController)
}

class VerifyConfiguratorImplementation: VerifyConfigurator {
    let loginParameter : LoginParamters
    var verifyPresenterDelegate: VerifyPresenterDelegate?
    
    init(loginParameter:LoginParamters) {
        self.loginParameter = loginParameter
    }
    
    init(loginParameter:LoginParamters, verifyPresenterDelegate: VerifyPresenterDelegate?) {
        self.loginParameter = loginParameter
        self.verifyPresenterDelegate = verifyPresenterDelegate
    }
    
    func configure(verifyViewController: VerifyViewController) {
        let router = VerifyViewRouterImplementation(verifyViewController: verifyViewController)
        let presenter = VerifyPresenterImplementation(view:verifyViewController, loginParameter: loginParameter, router: router, delegate: verifyPresenterDelegate!)
        
        verifyViewController.presenter = presenter
    }
}
