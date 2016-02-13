//
//  LeadsViewModel.swift
//  ios-test
//
//  Created by Garri Adrian Nablo on 2/13/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import Foundation
import Alamofire

protocol LeadsViewModelDelegate: class {
    func leadsViewModel(viewModel: LeadsViewModel, didFinishFetchingLeads leads: [Lead])
}

final class LeadsViewModel: NSObject {
    
    var leads = [Lead]()
    weak var delegate: LeadsViewModelDelegate?
    
    func fetchLeads() {
        let getLeadsRequest = ServiceSeekingAPI.Router.Leads
        Alamofire.request(getLeadsRequest).response { (request, response, data, error) -> Void in
            if let _ = error {
                // do something for error
            } else if let _ = data {
                // convert JSON to Lead object
                
                self.delegate?.leadsViewModel(self, didFinishFetchingLeads: self.leads)
            }
        }
    }
}