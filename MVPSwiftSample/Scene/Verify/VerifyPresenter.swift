//
//  VerifyPresenter.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import Foundation

protocol VerifyView: class {
    
}

protocol VerifyPresenterDelegate: class {
    func verifySuccess()
    func verifyFail()
}

protocol VerifyPresenter {
    var router : VerifyViewRouter { get }
    func verifyButtonPressed()
    func cancelVerifyButtonPressed()
}

class VerifyPresenterImplementation: VerifyPresenter {
    fileprivate weak var delegate: VerifyPresenterDelegate?
    private(set) var router: VerifyViewRouter
    
    init(router: VerifyViewRouter,
         delegate: VerifyPresenterDelegate) {
        self.router = router
        self.delegate = delegate
    }
    
    func verifyButtonPressed() {
        self.delegate?.verifySuccess()
        self.router.pop()
    }
    
    func cancelVerifyButtonPressed() {
        self.delegate?.verifyFail()
        self.router.pop()
    }
}
