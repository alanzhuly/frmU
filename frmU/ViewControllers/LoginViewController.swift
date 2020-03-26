//
//  LoginViewController.swift
//  frmU
//
//  Created by Lingyue Zhu on 3/25/20.
//  Copyright © 2020 FRM. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

//for the first page.
class LoginViewController: UIViewController{
    @IBOutlet weak var signInButton: GIDSignInButton!

    @IBOutlet weak var welcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func googleSignInPressed(_ sender: Any) {
//        GIDSignIn.sharedInstance()?.signIn()
//    }
//

    @IBAction func logIn(_ sender: Any) {
        if (signedIn == false) {
            welcome.text = "Sign In With Google First!"
            welcome.reloadInputViews()
        } else {
            performSegue(withIdentifier: "logIn", sender: sender)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
