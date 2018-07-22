//
//  ScaleImages+CoreDataProperties.swift
//  
//
//  Created by Chris Larsen on 7/20/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ScaleImages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScaleImages> {
        return NSFetchRequest<ScaleImages>(entityName: "ScaleImages")
    }

    @NSManaged public var scaleImage: Data?

}
