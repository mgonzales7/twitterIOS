//
//  TweetsViewController.swift
//  twitter
//
//  Created by Michael Gonzales on 2/21/16.
//  Copyright © 2016 MkGo. All rights reserved.
//

import UIKit
import MBProgressHUD

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var tweets: [Tweet]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshControlAction:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
            
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            self.tweets = tweets
            self.tableView.reloadData()
            
            
            
            }) { (error:NSError) -> () in
                print(error.localizedDescription)
        }

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tweetCell", forIndexPath: indexPath) as! TweetCell
        
        cell.selectionStyle = .None
        cell.tweet = tweets![indexPath.row]

        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        
        tableView.dataSource = self
        tableView.delegate = self
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            self.tweets = tweets
            self.tableView.reloadData()
            refreshControl.endRefreshing()	
            
            
            
            }) { (error:NSError) -> () in
                print(error.localizedDescription)
        }

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
