//
//  ViewController.swift
//  ios-test
//
//  Created by Justine on 19/01/2016.
//  Copyright © 2016 ServiceSeeking. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

    private var currentViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let leadsViewController = LeadsViewController()
        let leadsNavigationController = UINavigationController(rootViewController: leadsViewController)
        self.currentViewController = leadsNavigationController
        
        self.currentViewController.view.frame = self.view.bounds
        self.addChildViewController(self.currentViewController)
        self.view.addSubview(self.currentViewController.view)
        self.currentViewController.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Selector
    func didReceiveSuccessNotification() {
        currentViewController.willMoveToParentViewController(nil)
        
        let leadsViewController = LeadsViewController()
        let leadsNavigationController = UINavigationController(rootViewController: leadsViewController)
        
        self.transitionFromViewController(currentViewController,
            toViewController: leadsNavigationController,
            duration: 0.4,
            options: .TransitionCrossDissolve,
            animations: nil) { (completed) -> Void in
                self.currentViewController.removeFromParentViewController()
                self.currentViewController = leadsNavigationController
                self.currentViewController.didMoveToParentViewController(self)
        }
    }
}

