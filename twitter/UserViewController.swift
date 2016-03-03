//
//  UserViewController.swift
//  twitter
//
//  Created by Michael Gonzales on 3/2/16.
//  Copyright © 2016 MkGo. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var tweets: Tweet!
    var user: User?


    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = 5
        profileImage.clipsToBounds = true
        profileImage.setImageWithURL(NSURL(string:(tweets.user?.profileUrlString)! as String)!)
        //coverPic.setImageWithURL(NSURL(string:(tweets.user?.coverPhotoUrl)!)!)
        nameLabel.text = tweets.user?.name as! String
        handleLabel.text = "@\(tweets.user!.screename!)"
        
        
        if tweets.user!.following_count! < 1000 {
            followingCount.text = "\(tweets.user!.following_count!)"
        } else {
            followingCount.text = String(format: "%.2f", Double(tweets.user!.following_count!)/1000.0) + "k"
        }
        
        if tweets.user!.tweets_count! < 1000 {
            tweetCount.text = "\(tweets.user!.tweets_count!)"
        } else {
            tweetCount.text = String(format: "%.2f", Double(tweets.user!.tweets_count!)/1000.0) + "k"
            print(String(format: "%.2f", Double(tweets.user!.tweets_count!)/1000.0) + "k")
        }
        
        if tweets.user!.followers_count! < 1000 {
            followerCount.text = String(tweets.user!.followers_count!)
        } else {
            followerCount.text = String(format: "%.2f", Double(tweets.user!.followers_count!)/1000.0) + "k"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
