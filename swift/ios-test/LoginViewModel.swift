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

final class LoginViewModel: NSObject {
    
    var email = ""
    var password = ""
    
    func login() {
        let loginRequest = ServiceSeekingAPI.Router.Login(self.email, self.password)
        Alamofire.request(loginRequest).response { (request, response, data, error) -> Void in
            if let _ = error {
                NSNotificationCenter.defaultCenter().postNotificationName("FailLoginNotification", object: nil)
            } else if let data = data {
                let json = JSON(data: data)
                print(json)
                NSNotificationCenter.defaultCenter().postNotificationName("SuccessLoginNotification", object: nil)
            }
        }
    }
}