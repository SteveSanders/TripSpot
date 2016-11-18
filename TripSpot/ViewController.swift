//
//  ViewController.swift
//  TripSpot
//
//  Created by Steve Sandbach on 31/10/2016.
//  Copyright © 2016 Steve Sandbach. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    @IBOutlet weak var FaceBook: UIButton!
    weak var signIn: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.statusBarStyle = .lightContent
        
        //check to see if User is signed in...
        if (FBSDKAccessToken.current() != nil) {
            FaceBook.isHidden = true;
            logIn()
            //signIn.setTitle("Sign in as \(usersDetails.firstName) \(usersDetails.lastName)", for: .normal)
            print("Signed in already mate!")
            //switchMap()
        } else {
            signIn.isHidden = true
            print("Mate, you're not signed in!")
        }
        
        
        
        FaceBook.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
    }
    

    
    func handleCustomFBLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile", "user_friends"], from: self)
        { (result, err) in
            if err != nil {
                print (err as Any)
                return
            }
            logIn()
            self.switchMap()
        }

        
    }
    
    func changeView () {
        let viewController = self.storyboard! .instantiateViewController(withIdentifier: "MapView") as UIViewController;
        self.present(viewController, animated: true, completion: nil)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print ("Did log out")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print (error)
            return
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchMap() {
        let secondViewController:UIViewController = MapViewController()
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func setLogInButton () {
        signIn.setTitle("Sign in as \(usersDetails.firstName) \(usersDetails.lastName)", for: .normal)
        
    }
}
