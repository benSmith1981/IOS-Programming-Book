//
//  ViewController.swift
//  Quiz
//
//  Created by Ben Smith on 03/02/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let questions: [String] = ["What is  7 +7", "Capital of France"]
    
    let answers: [String] = ["14", "Paris"]
    
    var questionIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextQuestion(_ sender: AnyObject) {
        questionIndex += 1
        if (questionIndex == questions.count) {
            questionIndex = 0
        }
        questionLabel.text = questions[questionIndex]
        
    }

    @IBAction func answer(_ sender: AnyObject) {
        answerLabel.text = answers[questionIndex]
    }
}

