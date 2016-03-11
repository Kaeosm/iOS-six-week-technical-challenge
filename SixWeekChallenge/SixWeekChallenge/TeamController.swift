//
//  TeamController.swift
//  SixWeekChallenge
//
//  Created by Kaelin Osmun on 3/11/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation
import CoreData

class TeamsController {

    private let TeamKey = "teams"

    static let sharedController = TeamsController()

    var mockTeam:[Team] {
        let sampleTeam1 = Team(teamName:"Utah Jazz", teamCity: "Salt Lake City")
        let sampleTeam2 = Team(teamName:"Philadelphia 76ers", teamCity: "Philadelphia")
        let sampleTeam3 = Team(teamName:"Boston Celtics", teamCity: "Boston")

        return [sampleTeam1, sampleTeam2, sampleTeam3]
        
    }
    
    var team:[Team] {
        
        let request = NSFetchRequest(entityName: "Team")

        do {
            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Team]
        } catch {
            return []
        }
    
    }
    
    var allTeams:[Team] {
        
        return team.filter({$0.isExisting.boolValue})
        
    }
    
    func addTeam(teams: Team) {
    
        saveToPersistentStorage()
    
    }

    func removeTeam(teams: Team) {
        
        teams.managedObjectContext?.deleteObject(teams)
        saveToPersistentStorage()
}

    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Error saving Team. Team Not Saved")
        }
        }
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }

}
