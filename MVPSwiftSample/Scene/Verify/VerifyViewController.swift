//
//  VerifyViewController.swift
//  MVPSwiftSample
//
//  Created by Mehul on 02/06/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import UIKit

class VerifyViewController: UIViewController, VerifyView {

    var presenter: VerifyPresenter!
    var configurator : VerifyConfigurator!
    @IBOutlet weak var lblMobileNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(verifyViewController: self)
        presenter.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func verifyAction() {
        presenter.verifyButtonPressed()
    }
    
    @IBAction func cancelAction() {
        presenter.cancelVerifyButtonPressed()
    }
    
    func displayMobileNumber(mobile: String) {
        lblMobileNumber.text = mobile
    }
}
