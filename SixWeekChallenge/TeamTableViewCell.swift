//
//  TeamTableViewCell.swift
//  SixWeekChallenge
//
//  Created by Kaelin Osmun on 3/11/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit

@IBDesignable

class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var teamCityLabel: UILabel!
   
}
extension TeamTableViewCell {
    
    func updateWithTeam(team: Team) {
        
        teamNameLabel.text = team.teamName
        teamCityLabel.text = team.teamCity
    
}
}
