//
//  Pitches+CoreDataProperties.swift
//  
//
//  Created by Chris Larsen on 7/20/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Pitches {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pitches> {
        return NSFetchRequest<Pitches>(entityName: "Pitches")
    }

    @NSManaged public var pitch: NSObject?

}
