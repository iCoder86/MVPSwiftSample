//
//  VerifyViewRouter.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import Foundation

protocol VerifyViewRouter:ViewRouter {
    func pop()
}

class VerifyViewRouterImplementation: VerifyViewRouter {
    fileprivate weak var verifyViewController: VerifyViewController?
    
    init(verifyViewController: VerifyViewController) {
        self.verifyViewController = verifyViewController
    }
    
    func pop() {
        let _ = verifyViewController?.navigationController?.popViewController(animated: true)
    }
}
