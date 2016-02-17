//
//  LeadDetailViewModel.swift
//  ios-test
//
//  Created by Garri Adrian Nablo on 2/13/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import Foundation

class LeadDetailViewModel: NSObject {
    
    let lead: Lead!
    
    init(lead: Lead) {
        self.lead = lead
        super.init()
    }
}