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
            if let bundle = Bundle(path: Bundle.main.privateFrameworksPath!.appending("/AzureUIWrapper.framework")),
               let principleClass = bundle.principalClass as? UIViewController.Type {
                let controller = principleClass.init()
                print("loaded Hybrid VC")
                self.addChild(controller)
                view.addSubview(controller.view)
            }
        } else {
            print("Did not load hybrid VC")
        }
    }
}

