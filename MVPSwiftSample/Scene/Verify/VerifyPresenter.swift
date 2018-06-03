//
//  VerifyPresenter.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import Foundation

protocol VerifyView: class {
    func displayMobileNumber(mobile:String)
}

protocol VerifyPresenterDelegate: class {
    func verifySuccess()
    func verifyFail()
}

protocol VerifyPresenter {
    var router : VerifyViewRouter { get }
    func viewDidLoad()
    func verifyButtonPressed()
    func cancelVerifyButtonPressed()
}

class VerifyPresenterImplementation: VerifyPresenter {
    fileprivate let loginParameter: LoginParamters
    fileprivate weak var delegate: VerifyPresenterDelegate?
    private(set) var router: VerifyViewRouter
    fileprivate weak var view:VerifyView?
    
    init(view:VerifyView,
         loginParameter:LoginParamters,
         router: VerifyViewRouter,
         delegate: VerifyPresenterDelegate) {
        self.view = view
        self.router = router
        self.loginParameter = loginParameter
        self.delegate = delegate
    }
    
    func viewDidLoad() {
        view?.displayMobileNumber(mobile: loginParameter.loginMobileNumber)
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
