//
//  LeadDetailViewController.swift
//  ios-test
//
//  Created by Garri Adrian Nablo on 2/13/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import UIKit

class LeadDetailViewController: UIViewController {

    private let viewModel: LeadDetailViewModel!
    
    init(lead: Lead) {
        self.viewModel = LeadDetailViewModel(lead: lead)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Lead Detail"
        self.view.backgroundColor = .whiteColor()
        
        let usernameLabel = UILabel()
        usernameLabel.text = viewModel.lead.username
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(usernameLabel)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: usernameLabel, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 50.0),
            NSLayoutConstraint(item: usernameLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
            ])
        
        let nameLabel = UILabel()
        nameLabel.text = viewModel.lead.name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nameLabel)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: nameLabel, attribute: .Top, relatedBy: .Equal, toItem: usernameLabel, attribute: .Bottom, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: nameLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
            ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = viewModel.lead.jobDescription
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(descriptionLabel)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: descriptionLabel, attribute: .Top, relatedBy: .Equal, toItem: nameLabel, attribute: .Bottom, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: descriptionLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
            ])
        
        let suburbLabel = UILabel()
        suburbLabel.text = viewModel.lead.suburb
        suburbLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(suburbLabel)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: suburbLabel, attribute: .Top, relatedBy: .Equal, toItem: descriptionLabel, attribute: .Bottom, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: suburbLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
