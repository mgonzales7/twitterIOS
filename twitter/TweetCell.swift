//
//  TweetCell.swift
//  twitter
//
//  Created by Michael Gonzales on 2/22/16.
//  Copyright © 2016 MkGo. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {
    
    

    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var screenNameText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var tweetText: UILabel!
    
    @IBOutlet weak var favoriteCount: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    
    @IBOutlet weak var profileImage: UIButton!
   
    var tweetID: String?
    
    var tweet: Tweet! {
        didSet
        {
            tweetID = tweet.id
            print("setting")
            nameText.text = tweet.user?.name as? String
            screenNameText.text = "@\(tweet.user!.screename! as String)"
            print(tweet.text)
            tweetText.text = tweet.text!
            let url = NSURL(string: tweet.user?.profileUrlString as! String)
            print (url)
            profileImage.setBackgroundImageForState(UIControlState.Normal, withURL: url!)
            favoriteCount.text = String(tweet.favoritesCount)
            retweetCount.text = String(tweet.retweetCount)
            
    
        }
        
    }
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var reButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 3
        tweetText.preferredMaxLayoutWidth = tweetText.frame.size.width
        // Initialization code
    }
    
    
    @IBAction func favorite(sender: AnyObject) {
        
        TwitterClient.sharedInstance.favorite(Int(tweetID!)!, params: nil) { (error) -> () in
            if self.tweet.favorited == false {
                self.tweet.favorited = true
                self.tweet.favoritesCount += 1
                self.favoriteCount.text = "\((self.tweet.favoritesCount))"
                
                self.favButton.enabled = false

                
            } else {
                self.tweet.favorited = false
            }
        }
        
        /*
        
        tweet.favorited = true
        tweet.favoritesCount += 1
        favoriteCount.text = "\((tweet.favoritesCount))"
       
        favButton.enabled = false
*/

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func retweet(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(Int(tweetID!)!, params: nil) { (error) -> () in
            if self.tweet.retweeted == false {
                self.tweet.retweeted = true
                self.reButton.enabled = false
                self.tweet.retweetCount += 1
            } else {
                self.tweet.retweeted = false
               
            }
        }
    }
}

