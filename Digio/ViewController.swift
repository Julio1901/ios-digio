//
//  ViewController.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 29/06/24.
//

import UIKit
import os.log

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }

    func test1(age: Int) {
        os_log("test")
    }

    func executeOperation(completion: () -> Void) {
        completion()
    }
}
