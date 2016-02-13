//
//  LoginViewModel.swift
//  ios-test
//
//  Created by Garri Adrian Nablo on 2/13/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol LoginViewModelDelegate: class {
    func loginViewModelDidSuccessfullyLogin(viewModel: LoginViewModel)
    func loginViewModelDidFailLogin(viewModel: LoginViewModel, withError error: NSError)
}

final class LoginViewModel: NSObject {
    
    var email = ""
    var password = ""
    
    weak var delegate: LoginViewModelDelegate?
    
    func login() {
        let loginRequest = ServiceSeekingAPI.Router.Login(self.email, self.password)
        Alamofire.request(loginRequest).response { (request, response, data, error) -> Void in
            if let error = error {
                self.delegate?.loginViewModelDidFailLogin(self, withError: error)
            } else if let data = data {
                let json = JSON(data: data)
                print(json)
                self.delegate?.loginViewModelDidSuccessfullyLogin(self)
            }
        }
    }
}