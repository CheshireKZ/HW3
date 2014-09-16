//
//  ViewController.swift
//  Lecture2
//
//  Created by Igor Tomych on 04/09/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

import UIKit
import Alamofire

class LecturesListController: UITableViewController {
    
    var items: NSArray?
                            
    override func viewDidLoad() {
        super.viewDidLoad()
   //     let s = Alamofire.request(.GET, "http://httpbin.org/get")
  //      let s = Alamofire.request(.GET,"http://httpbin.org/get")
       let s = Alamofire.request(.GET,"http://weekly.master-up.net/api/v1/lecture/list/")
        Alamofire.request(.GET,"http://weekly.master-up.net/api/v1/lecture/list").responseJSON { (Request, Response, JSON, Error) -> Void in
           
            self.items = JSON as NSArray

            self.tableView.reloadData()
        }

         println(s)
    } 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.items?.count {
            return count
        }
        return 0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LectureCell") as UITableViewCell
        if let item = self.items{
            let newItem=item[indexPath.row] as NSDictionary
        cell.textLabel?.text = newItem["name"] as String
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let Lect = segue.destinationViewController as UIViewController
        
        if let indexPath = tableView.indexPathForSelectedRow() {
        Lect.title = "Лекция \(indexPath.row + 1)"
        }
        }
    }

