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
    
    @IBOutlet weak var profileImage: UIImageView!

    @IBOutlet weak var screenNameText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var tweetText: UILabel!
    
    @IBOutlet weak var favoriteCount: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    
   
    //var urlString: String?
    
    var tweet: Tweet! {
        didSet
        {
            nameText.text = tweet.user?.name as? String
            screenNameText.text = "@\(tweet.user!.screename! as String)"
            print(tweet.text)
            tweetText.text = tweet.text!
            let url = NSURL(string: tweet.user?.profileUrlString as! String)
            print (url)
            profileImage.setImageWithURL(url!)
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
    @IBAction func retweet(sender: AnyObject) {
        tweet.retweeted = true
        tweet.retweetCount += 1
        retweetCount.text = "\((tweet.retweetCount))"
        reButton.enabled = false
    }
    
    @IBAction func favorite(sender: AnyObject) {
        tweet.favorited = true
        tweet.favoritesCount += 1
        favoriteCount.text = "\((tweet.favoritesCount))"
        favButton.enabled = false

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
