//
//  SignInViewController.swift
//  SnapPick
//
//  Created by Peter Pickett on 8/27/17.
//  Copyright © 2017 Peter Pickett. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       Database.database().reference().child("hello").setValue("I am cool")
    }
    
    
    @IBAction func signinTap(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("Hey, we have an error: \(error)")
                
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("(2)Hey, we have an error: \(error)")
                    } else {
                        print("We successfully created a user account!")
                        
                        
                        
                        self.performSegue(withIdentifier: "signinSegue", sender: nil)
                    }
                })
                
            } else {
                print("We successfully signed in!")
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            }
        }
    }
    
    
}

