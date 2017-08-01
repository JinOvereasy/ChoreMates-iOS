//
//  SignUpViewController.swift
//  ChoreMates
//
//  Created by James Kang on 7/13/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    var globalGroupID = ""
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var groupIDTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func registerAccount(sender: UIButton) {
        // Validate the input
        guard let name = userNameTextField.text, name != "",
        let emailAddress = emailTextField.text, emailAddress != "",
        let password = passwordTextField.text, password != "" else {
            let alertController = UIAlertController(title: "Registration Error", message: "Please make sure you provide your name, email address and password to complete the registration.", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        // Register the user account on Firebase
        Auth.auth().createUser(withEmail: emailAddress, password: password, completion: { (user, error) in
            if let error = error {
                let alertController = UIAlertController(title: "Registration Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            // Save the name of the user
            if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                changeRequest.displayName = name
                changeRequest.commitChanges(completion: { (error) in
                    if let error = error {
                        print("Failed to change the display name: \(error.localizedDescription)")
                    }
                })
            }
            // Dismiss keyboard
            self.view.endEditing(true)
              // Send verification email
              user?.sendEmailVerification(completion: nil)
            
            let alertController = UIAlertController(title: "Email Verification", message: "We've just sent a confirmation email to your email address. Please check your inbox and click the verification link in that email to complete the sign up.", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                
                // USER SERVICE CREATE USER
                UserService.create(user!, username: self.userNameTextField.text!, groupID: self.groupIDTextField.text!, completion: { (newUser) in
                    self.dismiss(animated: true, completion: nil)
                    // get a global variable to store the groupID to be used in DetailViewController
                    self.globalGroupID = self.groupIDTextField.text!
                })
            })
            alertController.addAction(okayAction)
            self.present(alertController, animated: true, completion: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameTextField.becomeFirstResponder()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}





























