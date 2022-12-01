//
//  ViewController.swift
//  AzureUI Sample
//
//  Created by Andrea Mannucci on 29/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        if #available(iOS 14.0, *) {
            if let bundle = Bundle(identifier: "it.andreamannucci.AzureUIWrapper"),
               let principleClass = bundle.principalClass as? UIViewController.Type {
                let controller = principleClass.init()
                self.addChild(controller)
                view.addSubview(controller.view)
            }
        }
    }
}

