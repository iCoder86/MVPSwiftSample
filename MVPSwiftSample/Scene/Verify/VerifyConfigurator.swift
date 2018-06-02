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
    
    var verifyPresenterDelegate: VerifyPresenterDelegate?
    
    init(verifyPresenterDelegate: VerifyPresenterDelegate?) {
        self.verifyPresenterDelegate = verifyPresenterDelegate
    }
    
    func configure(verifyViewController: VerifyViewController) {
        let router = VerifyViewRouterImplementation(verifyViewController: verifyViewController)
        let presenter = VerifyPresenterImplementation(router: router, delegate: verifyPresenterDelegate!)
        
        verifyViewController.presenter = presenter
    }
}
