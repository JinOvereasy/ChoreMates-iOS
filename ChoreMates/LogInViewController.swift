//
//  LogInViewController.swift
//  ChoreMates
//
//  Created by James Kang on 7/11/17.
//  Copyright © 2017 James Kang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI

class LogInViewController: UIViewController {
    
    var window: UIWindow?
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - IBAction
    @IBAction func unwindtoWelcomeView(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func login(sender: UIButton) {
        // Validate the input
        guard let emailAddress = emailTextField.text, emailAddress != "",
            let password = passwordTextField.text, password != "" else {
                let alertController = UIAlertController(title: "Login Error", message: "Both fields must not be blank.", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                present(alertController, animated: true, completion: nil)
                
                return
        }
        // Perform login by calling Firebase APIs
        Auth.auth().signIn(withEmail: emailAddress, password: password, completion: {
            (user, error) in
            if let error = error {
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            // Email verification
            guard let currentUser = user, currentUser.isEmailVerified else {
                let alertController = UIAlertController(title: "Login Error", message: "You haven't confirmed your email address yet. We sent you a confirmation email when you sign up. Please click the verification link in that email. If you need us to send the confirmation email again, please tap Resent email.", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "Resent email", style: .default, handler: { (action) in
                    user?.sendEmailVerification(completion: nil)
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            
            // dissmiss keyboard
            self.view.endEditing(true)
            
            // Present the main view
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
            }
            
            UserService.show(forUID: (user?.uid)!) { (user) in
                if let user = user {
                    // handle existing user
                    User.currentUser! = user
                    let storyboard = UIStoryboard(name: "Main", bundle: .main)
                    if let initialViewController = storyboard.instantiateInitialViewController() {
                        self.window?.rootViewController = initialViewController
                        self.window?.makeKeyAndVisible()
                    }
                } else {
                    // handle new user
                    let signUpBoard = UIStoryboard(name: "Login", bundle: .main)
                    let initialViewController = signUpBoard.instantiateViewController(withIdentifier: "SignUpView")
                    self.window?.rootViewController = initialViewController
                    self.window?.makeKeyAndVisible()
                }
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Hide the navigation bar for current view controller
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        // or   self.navigationController?.isNavigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
}







