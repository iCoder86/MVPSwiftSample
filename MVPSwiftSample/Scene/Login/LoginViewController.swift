//
//  LoginViewController.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginView {

    var configurator = LoginConfiguratorImplementation()
    var presenter: LoginPresenter!
    
    @IBOutlet weak var txtMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(loginViewController: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButtonPressed() {
        let loginParameter = LoginParamters(loginMobileNumber: txtMobile.text!)
        presenter.loginButtonPressed(loginParameter: loginParameter)
    }
    
    // MARK: - VerifyViewControllerDelegate
    
    func updateViewOnSuccessVerify() {
        print("updateViewOnSuccessVerify")
    }
    
    func updateViewOnFailVerify() {
        print("updateViewOnFailVerify")
    }
}

