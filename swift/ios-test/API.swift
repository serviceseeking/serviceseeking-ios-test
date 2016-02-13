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
        
        // MARK: URLRequestConvertible
        var URLRequest: NSMutableURLRequest {
            let parameters: [String: AnyObject] = {
                switch self {
                case .Login(let email, let password):
                    return ["email": email, "password": password]
                case .Leads:
                    return ["": ""]
                }
            }()
            
            let URL = NSURL(string: Router.baseURLString)!
            let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(self.path))
            URLRequest.HTTPMethod = method.rawValue
            URLRequest.setValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
            URLRequest.setValue("application/vnd.api+json", forHTTPHeaderField: "Accept")
            URLRequest.setValue("1", forHTTPHeaderField: "version")
            //URLRequest.setValue("compress, gzip", forHTTPHeaderField: "Accept-Encoding")
            let encoding = Alamofire.ParameterEncoding.URL
            
            // append login token
            /*if let authToken = Utility.authToken {
            URLRequest.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
            }*/

            let dataParameters = ["type": "user_sessions", "attributes": parameters]
            return encoding.encode(URLRequest, parameters: ["data": dataParameters]).0
        }
    }
}
