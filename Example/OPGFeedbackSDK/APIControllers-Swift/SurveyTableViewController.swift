//
//  SurveyTableViewController.swift
//  SDKDemoApp
//
//  Created by OnePoint Global on 05/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

import UIKit

class SurveyTableViewController: UITableViewController
{
    var surveyListArray : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.orange
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.surveyListArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as UITableViewCell?
        if (cell == nil) {
            cell = UITableViewCell(style:.default, reuseIdentifier: "CELL")
        }
        let survey : OPGSurvey = surveyListArray.object(at: (indexPath as NSIndexPath).row) as! OPGSurvey
        // setup cell without force unwrapping it
        cell?.textLabel!.text = survey.surveyName
        return cell!
    }

}
