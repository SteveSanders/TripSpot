//
//  dataModel.swift
//  
//
//  Created by Steve Sandbach on 11/11/2016.
//
//

import UIKit
import FBSDKLoginKit

var logInRecieved = false
var friendsRecieved = false

func logIn() {
    print("Log in called")
    FBLogIn();
    //getFriends();
    //postDetails();
    
}

func FBLogIn() {
    print("about to send request")
    FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "name, first_name, last_name, email, picture"]).start { (connection, result, err) -> Void in
        print("Request sent")
        if err != nil {
            print (err)
            return
        }
        let resultP = result as? NSDictionary
        usersDetails.firstName = (resultP?["first_name"] as? String)!
        usersDetails.lastName = (resultP?["last_name"] as? String)!
        usersDetails.email  = (resultP?["email"] as? String)!
        let image = resultP?["picture"]
        let imageURL = image as? [String: AnyObject]
        let address = imageURL?["data"] as? [String: AnyObject]
        usersDetails.image = (address?["url"] as? String)!
        usersDetails.authenticated = true
        usersDetails.FBID = (resultP?["id"] as? String)!
        logInRecieved = true
        print("Log in details recieved")
        getFriends()
        //postDetails()
        //setLogInButton()
    }
}

func getFriends () {
    //print("printing friends...")
    let parameters = ["fields": "name, uid, first_name, last_name, picture"]
    FBSDKGraphRequest(graphPath: "me/friends", parameters: parameters).start { (connection, user, requestError) in
        if requestError != nil {
            print(requestError as Any)
            return
        }
        let userP = user as! NSDictionary
        for FriendDictionary in userP["data"] as! [NSDictionary] {
            let firstName = FriendDictionary["first_name"] as? String
            let lastName = FriendDictionary["last_name"] as? String
            let id = FriendDictionary["id"] as? String
            let image = FriendDictionary["picture"] as? [String: AnyObject]
            let address = image?["data"] as? [String: AnyObject]
            userAddress = address?["url"] as? String
            
            
            let friend = Friend(firstName: firstName!, lastName: lastName!, image: userAddress, FBID: id!)
            subscribers.append(friend)
        }
        print("friends recieved")
        friendsRecieved = true
        postDetails()
    }
}


func postDetails() {
    var jsonFriends = [AnyObject]()
    if friendsRecieved && logInRecieved {
        //let json = usersDetails
        
        
        
        for subscriber in subscribers {
            var friend = [String: AnyObject]()
            
            friend["firstName"] = subscriber.firstName as AnyObject
            friend["lastName"] = subscriber.lastName as AnyObject
            friend["FacebookId"] = subscriber.FBID as AnyObject
            friend["ProfilePictureUrl"] = subscriber.image as AnyObject
            
            jsonFriends.append(friend as AnyObject)
//            print(jsonFriends)
            }
            
        
            
        }

        print("Json freinds are -> ", jsonFriends)
        var jsonReady: [String : AnyObject] {
            return [
                // add back in when subscribers have been JSONified
                "Subscriptions" : jsonFriends as AnyObject,
                "FacebookId" : usersDetails.FBID as AnyObject,
                "FirstName": usersDetails.firstName as AnyObject,
                "LastName": usersDetails.lastName as AnyObject,
                "email": usersDetails.email as AnyObject,
                "ProfilePictureUrl": usersDetails.image as AnyObject,
            ]
        }
        
    //print(jsonReady)
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonReady, options: .prettyPrinted)
            let datastring = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
            let url = NSURL(string: "http://tripspotstag.azurewebsites.net/api/FacebookUser")
            let request = NSMutableURLRequest(url: url as! URL)
            request.httpMethod = "POST"
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    return
                }
                do {
//                    print("Got here", data)
                    let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                    let resultP = result as! NSDictionary
                    usersDetails.TSID = (resultP["id"] as? String)!
                    print("Result -> \(result)")
                    print("Users Details -> ", usersDetails)
                    print("Subscribers -> ", subscribers)
                    
                } catch {
                    print("Error -> \(error)")
                }
            }
            usersDetails.authenticated = true
            task.resume()
        } catch {
            print("JSON error: \(error.localizedDescription)")

        }
    }

//var vc = viewController()
//func application(application: UIApplication, didFinishLaunchingWithOptions: [NSObject: AnyObject]? -> Bool,
//    {
//    vc.firstName = 'test'
//    
//    })
