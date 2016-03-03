//
//  ComposeViewController.swift
//  twitter
//
//  Created by Michael Gonzales on 3/3/16.
//  Copyright © 2016 MkGo. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    var tweets: Tweet!
    var user: User?
    var tweetToSend: String = ""
    let client = TwitterClient.sharedInstance

    @IBOutlet weak var tweetText: UITextView!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetText.delegate = self
        profileImage.layer.cornerRadius = 5
        profileImage.clipsToBounds = true
        profileImage.setImageWithURL(NSURL(string:(User.currentUser?.profileUrlString!)! as String)!)
        
        nameLabel.text = User.currentUser?.name! as! String
        handleLabel.text = "@\(User.currentUser!.screename! as! String)"
        let myGesture = UITapGestureRecognizer(target: self, action: "tappedAwayFunction")
        self.view.addGestureRecognizer(myGesture)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func send(sender: AnyObject) {
        let tweet = tweetToSend.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        
        client.compose(tweet!, params: nil, completion: { (error) -> () in
            print("about to tweet")
        })
        dismissViewControllerAnimated(true, completion: {})
    }
    func tappedAwayFunction(sender: UITapGestureRecognizer){
        tweetText.resignFirstResponder()
    }
    
    func textViewDidChange(textView: UITextView) {
        tweetToSend = tweetText.text
        
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
