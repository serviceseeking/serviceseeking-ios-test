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
                let failLoginNotification = NSNotification(name: "FailLoginNotification", object: nil, userInfo: ["message": "Error Loggin In"])
                NSNotificationCenter.defaultCenter().postNotification(failLoginNotification)
            } else if let data = data {
                let json = JSON(data: data)
                if json["data"]["attributes"] != nil {
                    let userAttributes = json["data"]["attributes"]
                    let user = User.sharedUser
                    user.name = userAttributes["name"].stringValue
                    user.email = userAttributes["email"].stringValue
                    user.status = userAttributes["status"].stringValue
                    user.phone = userAttributes["phone"].stringValue
                    user.createdAt = userAttributes["createdAt"].stringValue
                    user.updatedAt = userAttributes["updatedAt"].stringValue
                    user.token = json["meta"]["token"].stringValue
                    NSNotificationCenter.defaultCenter().postNotificationName("SuccessLoginNotification", object: nil)
                } else {
                    let failLoginNotification = NSNotification(name: "FailLoginNotification", object: nil, userInfo: ["message": "The information entered is incorrect"])
                    NSNotificationCenter.defaultCenter().postNotification(failLoginNotification)
                }
            }
        }
    }
}