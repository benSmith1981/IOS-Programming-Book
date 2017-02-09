//
//  ViewController.swift
//  Ch 9 - debugging
//
//  Created by Ben Smith on 08/02/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        print("Method: \(#function) in file: \(#file) line: \(#line) called")
        print("Sender \(sender)")

//        print("button tapped \(sender.isOn)")

        badMethod()
    }
    
    func badMethod() {
        let array = NSMutableArray()
        for i in 0..<9 {
            array.insert(i, at: i)
        }
        
        for _ in 0...10 {
            array.remove(at: 0)
        }
    }

}

