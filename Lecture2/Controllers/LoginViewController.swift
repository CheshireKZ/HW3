//
//  LoginViewController.swift
//  Lecture2
//
//  Created by Igor Tomych on 04/09/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func loginAction(sender: UIButton) {
        navigationController!.dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBOutlet weak var loginAction: UIButton!
}
