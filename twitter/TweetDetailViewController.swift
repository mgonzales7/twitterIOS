//
//  TweetDetailViewController.swift
//  twitter
//
//  Created by Michael Gonzales on 3/1/16.
//  Copyright © 2016 MkGo. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = tweet.user?.name as? String
        handleLabel.text = "@\(tweet.user!.screename! as String)"
        print(tweet.text)
        textLabel.text = tweet.text!
        let url = NSURL(string: tweet.user?.profileUrlString as! String)
        print (url)
        profileImage.setImageWithURL(url!)
        //favoriteCount.text = String(tweet.favoritesCount)
        //retweetCount.text = String(tweet.retweetCount)


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
