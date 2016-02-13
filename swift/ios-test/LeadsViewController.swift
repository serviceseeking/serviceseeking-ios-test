//
//  LeadsViewController.swift
//  ios-test
//
//  Created by Garri Adrian Nablo on 2/13/16.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import UIKit

private let LeadCellReuseIdentifier = "LeadCell"

final class LeadsViewController: UIViewController {

    private let tableView = UITableView()
    private let viewModel = LeadsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Leads"
        self.view.backgroundColor = .whiteColor()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: LeadCellReuseIdentifier)
        self.view.addSubview(tableView)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: tableView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: tableView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: tableView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: tableView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
            ])
        
        viewModel.delegate = self
        viewModel.fetchLeads()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableViewDelegate
extension LeadsViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let leadDetailViewController = LeadDetailViewController(lead: viewModel.leads[indexPath.item])
        self.navigationController?.pushViewController(leadDetailViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension LeadsViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.leads.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(LeadCellReuseIdentifier, forIndexPath: indexPath)
        
        let lead = viewModel.leads[indexPath.item]
        cell.textLabel?.text = lead.name
        cell.detailTextLabel?.text = lead.username
        
        return cell
    }
}

// MARK: - LeadsViewModelDelegate
extension LeadsViewController: LeadsViewModelDelegate {
    func leadsViewModel(viewModel: LeadsViewModel, didFinishFetchingLeads leads: [Lead]) {
        tableView.reloadData()
    }
}
