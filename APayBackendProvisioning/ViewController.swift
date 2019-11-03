//
//  ViewController.swift
//  APayBackendProvisioning
//
//  Created by Chinyiu Chau on 01.11.19.
//  Copyright © 2019 Chinyiu Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RunDown().run()
    }

    @IBAction func reload(){
        RunDown().run()
    }
}

