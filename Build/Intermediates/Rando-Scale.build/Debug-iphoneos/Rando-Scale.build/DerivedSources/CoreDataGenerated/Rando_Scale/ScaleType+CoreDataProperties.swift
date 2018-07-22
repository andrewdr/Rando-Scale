//
//  ScaleType+CoreDataProperties.swift
//  
//
//  Created by Chris Larsen on 7/20/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ScaleType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScaleType> {
        return NSFetchRequest<ScaleType>(entityName: "ScaleType")
    }

    @NSManaged public var major: NSObject?
    @NSManaged public var minors: NSObject?
    @NSManaged public var modes: NSObject?
    @NSManaged public var symmetrics: NSObject?

}
