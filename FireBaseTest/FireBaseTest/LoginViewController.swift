//
//  ViewController.swift
//  FireBaseTest
//
//  Created by Ben Smith on 16/02/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    var myUsername : String = "testfire@test.com"
    var myPassword : String = "123456"
    
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var userNameLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginButton(_ sender: AnyObject) {
//        myUsername = userNameLabel.text!
//        myPassword = passLabel.text!
        
        FIRAuth.auth()?.signIn(withEmail: self.myUsername, password: self.myPassword) { (user, error) in
            if error != nil {
                // self.errorMessage.text = error as! String?
                print(error)
            } else {
                //                self.errorMessage.text = "Account created with email \(user!.email!)!"
                
                FIRAnalytics.logEvent(withName: "Login", parameters: [
                    "Type": "Email" as NSObject,
                    "user": self.myUsername as NSObject
                    ])
                self.performSegue(withIdentifier: "signup", sender: self)
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "NotLoggedIn")// as! NotLoggedIn
//                
//                vc?.dismiss(animated: false, completion: nil)
//                
//                self.dismiss(animated: false, completion: nil)
                
                
            }
        }
        
    }
    
    @IBAction func signUpButton(_ sender: AnyObject) {
        myUsername = userNameLabel.text!
        myPassword = passwordLabel.text!
        
        FIRAuth.auth()?.createUser(withEmail: self.myUsername, password: self.myPassword) { (user, error) in
            if error != nil {
                // self.errorMessage.text = error as! String?
                print(error)
            } else {
                //                self.errorMessage.text = "Account created with email \(user!.email!)!"
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "NotLoggedIn")// as! NotLoggedIn
                vc?.dismiss(animated: false, completion: nil)
                self.dismiss(animated: false, completion: nil)
                
                FIRAnalytics.logEvent(withName: "SignUpp", parameters: [
                    "Type": "Email" as NSObject,
                    "user": self.myUsername as NSObject
                    ])
                self.performSegue(withIdentifier: "signup", sender: self)
                //  self.present(ScreenAfterLogin, animated: true, completion: nil)
                
            }
        }
        
    }
}

