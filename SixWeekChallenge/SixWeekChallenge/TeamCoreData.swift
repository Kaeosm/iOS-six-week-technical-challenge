//
//  TeamCoreData.swift
//  SixWeekChallenge
//
//  Created by Kaelin Osmun on 3/11/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation
import CoreData

extension Team {

@NSManaged var teamName: String
@NSManaged var teamCity: String
    @NSManaged var isExisting: NSNumber
}