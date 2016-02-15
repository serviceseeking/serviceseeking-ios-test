//
//  LoginViewController.swift
//  ios-test
//
//  Created by Garri Adrian Nablo on 2/13/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import UIKit
import PKHUD

final class LoginViewController: UIViewController {

    private let viewModel = LoginViewModel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .whiteColor()
        
        emailTextField.delegate = self
        emailTextField.placeholder = "Email"
        emailTextField.textAlignment = .Center
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(emailTextField)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: emailTextField, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 50.0),
            NSLayoutConstraint(item: emailTextField, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: emailTextField, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20.0)
            ])
        
        passwordTextField.delegate = self
        passwordTextField.secureTextEntry = true
        passwordTextField.textAlignment = .Center
        passwordTextField.placeholder = "Password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(passwordTextField)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: passwordTextField, attribute: .Top, relatedBy: .Equal, toItem: emailTextField, attribute: .Bottom, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: passwordTextField, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: passwordTextField, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20.0)
            ])
        
        let loginButton = UIButton(type: .System)
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.setTitleColor(.blueColor(), forState: .Normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: "didTapLoginButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: loginButton, attribute: .Top, relatedBy: .Equal, toItem: emailTextField, attribute: .Bottom, multiplier: 1.0, constant: 50.0),
            NSLayoutConstraint(item: loginButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: loginButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20.0)
            ])
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveFailLoginNotification:", name: "FailLoginNotification", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Selector
    func didTapLoginButton() {
        if let email = emailTextField.text where email.characters.count > 0,
            let password = passwordTextField.text where password.characters.count > 0 {
                
            // show HUD
            let hud = PKHUD.sharedHUD
            hud.contentView = PKHUDTextView(text: "Logging in...")
            hud.dimsBackground = true
            hud.show()
            
            // update data models
            self.viewModel.email = email
            self.viewModel.password = password
            self.viewModel.login()
        } else {
            self.showAlert(withMessage: "Email and Password must not be empty")
        }
    }
    
    func didReceiveFailLoginNotification(notification: NSNotification) {
        PKHUD.sharedHUD.hide()
        
        let errorAlertController = UIAlertController(title: nil, message: "Error logging in ", preferredStyle: .Alert)
        errorAlertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(errorAlertController, animated: true, completion: nil)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
