//
//  User.swift
//  ios-test
//
//  Created by Garri Adrian Nablo on 2/14/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import Foundation

class User: NSObject {

    var name = ""
    var email = ""
    var status = ""
    var phone = ""
    var createdAt = ""
    var updatedAt = ""
    var token = ""
    
    // add class constant for singleton implementation
    static let sharedUser = User()
}