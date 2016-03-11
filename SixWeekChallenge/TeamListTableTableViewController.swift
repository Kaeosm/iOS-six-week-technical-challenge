//
//  TeamListTableTableViewController.swift
//  SixWeekChallenge
//
//  Created by Kaelin Osmun on 3/11/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit

class TeamListTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

        override func viewDidAppear(animated: Bool) {
            
            tableView.reloadData()
        }
        
    


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TeamsController.sharedController.team.count
        
    }

       override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("teamCell", forIndexPath: indexPath) as! TeamTableViewCell
        
        let team = TeamsController.sharedController.allTeams[indexPath.row]
        
        cell.updateWithTeam(team)
        

        return cell
    }
  
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
          
            let team = TeamsController.sharedController.allTeams[indexPath.row]
            TeamsController.sharedController.removeTeam(team)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
           
        }    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toViewTeam" {
            
            let destinantionViewController = segue.destinationViewController as? AddTeamTableViewController
            
            if let AddTeamTableViewController = destinantionViewController {
                
                _ = AddTeamTableViewController.view
                
                if let selectedRow = tableView.indexPathForSelectedRow?.row {
                    AddTeamTableViewController.updateWithTeam(TeamsController.sharedController.allTeams[selectedRow])
                }
            }
        }
        
    }
 

}
