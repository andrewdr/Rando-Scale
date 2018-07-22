//
//  ScaleDescription+CoreDataProperties.swift
//  
//
//  Created by Chris Larsen on 7/20/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ScaleDescription {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScaleDescription> {
        return NSFetchRequest<ScaleDescription>(entityName: "ScaleDescription")
    }

    @NSManaged public var scaleDescriptionText: NSObject?

}
