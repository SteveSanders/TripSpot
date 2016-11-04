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

    override func viewDidLoad() {
                print("Test 1")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.statusBarStyle = .lightContent
        
        FaceBook.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
    }
    
    func handleCustomFBLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self)
        { (result, err) in
            if err != nil {
                print ("fail")
                return
            }
            self.showEmailAddress()
        }
    }
    
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print ("Did log out")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("Test 2")
        if error != nil {
            print("It did not work!")
            print (error)
            return
        }
        showEmailAddress()
    }
    
    func showEmailAddress() {

        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            
            if err != nil {
                print ("something fucked up")
                return
            }
            print (result)
            let viewController = self.storyboard! .instantiateViewController(withIdentifier: "MapView") as UIViewController;
            self.present(viewController, animated: true, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

