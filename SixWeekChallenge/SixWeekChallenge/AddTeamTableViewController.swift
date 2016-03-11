//
//  AddTeamTableViewController.swift
//  SixWeekChallenge
//
//  Created by Kaelin Osmun on 3/11/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit

class AddTeamTableViewController: UITableViewController {

    var team: Team?

    @IBOutlet weak var teamNameTextField: UITextField!
    
    @IBOutlet weak var teamCityTextField: UITextField!
    
    @IBAction func SaveButtonTapped(sender: AnyObject) { updateTeam()
    
    }

    func updateTeam() {
        let teamName = teamNameTextField.text!
        let teamCity = teamCityTextField.text!
        
        if let team = self.team {
            team.teamName = teamName
            team.teamCity = teamCity
        } else {
            
            let newTeam = Team(teamName: teamName, teamCity: teamCity)
            TeamsController.sharedController.addTeam(newTeam)
        }
        
    }

    func updateWithTeam(team: Team) {
        self.team = team
        
        title = "Team"
        teamNameTextField.text = team.teamName
        teamCityTextField.text = team.teamCity
    }
    
}