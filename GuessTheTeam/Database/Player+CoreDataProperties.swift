//
//  Player+CoreDataProperties.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 03/02/21.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var name: String?
    @NSManaged public var club: String?
    @NSManaged public var nationality: String?
    @NSManaged public var function: String?
    @NSManaged public var team: Team?

}

extension Player : Identifiable {

}
