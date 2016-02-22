//
//  User.swift
//  twitter
//
//  Created by Michael Gonzales on 2/21/16.
//  Copyright © 2016 MkGo. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: NSString?
    var screename: NSString?
    var profileUrlString: NSString?
    var tagline: NSString?
    
    static let userDidLogoutNotification = "userDidLogout"
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screename = dictionary["screen_name"] as? String
        
        profileUrlString = dictionary["profile_image_url"] as? String
        tagline = dictionary["description"] as? String
        
    }
    
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            if _currentUser == nil{
                let defaults = NSUserDefaults.standardUserDefaults()
                let userData = defaults.objectForKey("currentUserData") as? NSData
            
                if let userData = userData{
                    let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as!NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user{
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                
                defaults.setObject(data, forKey: "currentUserData")
            } else {
                defaults.setObject(nil, forKey: "currentUserData")
            }
            defaults.synchronize()
        }
    }

}
