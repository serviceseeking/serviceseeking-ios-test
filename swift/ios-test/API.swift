//
//  API.swift
//  ios-test
//
//  Created by Garri Adrian Nablo on 2/13/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct ServiceSeekingAPI {
    enum Router: URLRequestConvertible {
        case Login(String, String)
        case Leads
        
        static let baseURLString = "https://staging.serviceseeking.com.au"
        
        var method: Alamofire.Method {
            switch self {
            case .Login:
                return .POST
            case .Leads:
                return .GET
            }
        }
        
        var path: String {
            switch self {
            case .Login:
                return "/users/sign_in"
            case .Leads:
                return "/leads"
            }
        }
        
        var URLRequest: NSMutableURLRequest {
            let URL = NSURL(string: Router.baseURLString)!
            let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(self.path))
            URLRequest.HTTPMethod = method.rawValue
            URLRequest.setValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
            URLRequest.setValue("application/vnd.api+json; version=1", forHTTPHeaderField: "Accept")
            
            var authorizationValue = "Basic c3NzdGFnaW5nOnNzVDNzdDFuZyE="
            if User.sharedUser.token.characters.count > 0 {
                // append token if available
                authorizationValue.appendContentsOf(", Token token=\(User.sharedUser.token)")
            }
            URLRequest.setValue(authorizationValue, forHTTPHeaderField: "Authorization")
            
            switch self {
            case .Login(let email, let password):
                let parameters = ["email": "test_business@serviceseeking.com.au", "password": "123123"]
                //let parameters = ["email": email, "password": password]
                
                // append parameters to body
                let dataParameters = ["type": "user_sessions", "attributes": parameters]
                let jsonData = try! NSJSONSerialization.dataWithJSONObject(["data": dataParameters], options: .PrettyPrinted)
                URLRequest.HTTPBody = jsonData
            case .Leads:
                break
            }
            
            return URLRequest
        }
    }
}
