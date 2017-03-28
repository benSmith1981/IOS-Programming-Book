//
//  ViewController.swift
//  HowAnAppFunctions
//
//  Created by Ben Smith on 13/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        doSomething()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func loadView() {
        super.loadView()
        print("load view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doSomething()  {
        //
    }

}

