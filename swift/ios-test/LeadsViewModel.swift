//
//  LeadsViewModel.swift
//  ios-test
//
//  Created by Garri Adrian Nablo on 2/13/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol LeadsViewModelDelegate: class {
    func leadsViewModel(viewModel: LeadsViewModel, didFinishFetchingLeads leads: [Lead])
}

final class LeadsViewModel: NSObject {
    
    var leads = [Lead]()
    weak var delegate: LeadsViewModelDelegate?
    
    func fetchLeads() {
        let getLeadsRequest = ServiceSeekingAPI.Router.Leads
        Alamofire.request(getLeadsRequest).response { (request, response, data, error) -> Void in
            print(response!.allHeaderFields)
            if let error = error {
                // do something for error
                print(error)
            } else if let data = data {
                let json = JSON(data: data)
                for (_, leadJSON) in json["data"] {
                    let leadAttributes = leadJSON["attributes"]
                    
                    let lead = Lead()
                    lead.name = leadAttributes["name"].stringValue
                    lead.jobDescription = leadAttributes["description"].stringValue
                    lead.username = leadAttributes["userName"].stringValue
                    lead.suburb = leadAttributes["suburbName"].stringValue
                    lead.biddingClosesOn = leadAttributes["biddingClosesOn"].stringValue
                    lead.distanceAway = leadAttributes["distanceAway"].doubleValue
                    lead.canQuote = leadAttributes["canQuote"].boolValue
                    lead.withinRange = leadAttributes["withinRange"].boolValue
                    lead.isNew = leadAttributes["new"].boolValue
                    lead.isFeatured = leadAttributes["featured"].boolValue
                    lead.isUrgent = leadAttributes["urgent"].boolValue
                    lead.isPrivate = leadAttributes["private"].boolValue
                    lead.createdAt = leadAttributes["createdAt"].stringValue
                    lead.updatedAt = leadAttributes["updatedAt"].stringValue
                    self.leads.append(lead)
                }

                self.delegate?.leadsViewModel(self, didFinishFetchingLeads: self.leads)
            }
        }
    }
}