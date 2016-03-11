//
//  Teams.swift
//  SixWeekChallenge
//
//  Created by Kaelin Osmun on 3/11/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation
import CoreData

@objc(Team)
class Team: NSManagedObject {
    
    convenience init(teamName: String, teamCity: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("teams", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.teamName = teamName
        self.teamCity = teamCity
    }
}