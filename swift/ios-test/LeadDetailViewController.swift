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
        self.edgesForExtendedLayout = .None
        self.view.backgroundColor = .whiteColor()
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: scrollView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: scrollView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: scrollView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: scrollView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
            ])
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: contentView, attribute: .Top, relatedBy: .Equal, toItem: scrollView, attribute: .Top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: contentView, attribute: .Left, relatedBy: .Equal, toItem: scrollView, attribute: .Left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: contentView, attribute: .Right, relatedBy: .Equal, toItem: scrollView, attribute: .Right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: contentView, attribute: .Bottom, relatedBy: .Equal, toItem: scrollView, attribute: .Bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: contentView, attribute: .CenterX, relatedBy: .Equal, toItem: scrollView, attribute: .CenterX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: contentView, attribute: .CenterY, relatedBy: .Equal, toItem: scrollView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
            ])
        
        let usernameLabel = UILabel()
        usernameLabel.textAlignment = .Left
        usernameLabel.text = viewModel.lead.username
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(usernameLabel)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: usernameLabel, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: usernameLabel, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: usernameLabel, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20.0)
            ])
        
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .Left
        nameLabel.text = viewModel.lead.name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: nameLabel, attribute: .Top, relatedBy: .Equal, toItem: usernameLabel, attribute: .Bottom, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: nameLabel, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: nameLabel, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20.0)
            ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .Left
        descriptionLabel.text = viewModel.lead.jobDescription
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: descriptionLabel, attribute: .Top, relatedBy: .Equal, toItem: nameLabel, attribute: .Bottom, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: descriptionLabel, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: descriptionLabel, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20.0)
            ])
        
        let suburbLabel = UILabel()
        suburbLabel.textAlignment = .Left
        suburbLabel.text = viewModel.lead.suburb
        suburbLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(suburbLabel)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: suburbLabel, attribute: .Top, relatedBy: .Equal, toItem: descriptionLabel, attribute: .Bottom, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: suburbLabel, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: suburbLabel, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20.0)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
