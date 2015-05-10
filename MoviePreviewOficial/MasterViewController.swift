//
//  MasterViewController.swift
//  MoviePreviewOficial
//
//  Created by Kaue Mendes on 4/30/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = [AnyObject]()
    var detailViewController : DetailViewController? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = NSBundle.mainBundle().pathForResource("MoviesPreview", ofType: "plist")
        self.objects = NSArray(contentsOfFile: path!) as! [[String:String]]
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
        }

    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetail", sender: indexPath)
        //
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func insertNewObject(sender: AnyObject) {
//        objects.insert(NSDate(), atIndex: 0)
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                
                var index = sender as! NSIndexPath
                controller.filmes = self.objects[index.row] as! [String : String]
                
                
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let filme: (AnyObject) = self.objects[indexPath.row]
        cell.textLabel!.text = filme["nome"] as? String
    
        return cell
    }


}

