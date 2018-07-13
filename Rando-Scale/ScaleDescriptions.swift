//
//  ScaleDescriptions.swift
//  Rando-Scale
//
//  Created by The Clout on 7/12/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import Foundation
import UIKit
import CoreData


    let majorText = "A major scale follows the step pattern: whole, whole, half, whole, whole, whole, half, and is also known as the Ionian mode."
    
    let naturalMinorText = "The natural minor scale follows the pattern: 1, 2,♭3, 4, 5, ♭6, ♭7, and is the sixth mode of the major scale or Aeolian mode."
    let harmonicMinorText = "The harmonic minor scale follows the pattern: 1, 2, ♭3, 4, 5, ♭6, ♮7."
    let melodicMinorText = "The melodic minor scale follows the pattern: 1, 2, ♭3, 4, 5, ♮6, ♮7."
    let bluesText = "The Blues scale follows the pattern: 1, ♭3, 4, ♭5, ♮5, ♭7."
    
    let dorianText = "The Dorian mode follows the pattern: 1, 2,♭3, 4, 5, 6, ♭7, and is the second mode of the major scale."
    let phrygianText = "The Phrygian mode follows the pattern: 1, ♭2,♭3, 4, 5, ♭6, ♭7, and is the third mode of the major scale."
    let lydianText = "The Lydian mode follows the pattern: 1, 2, 3, ♯4, 5, 6, 7, and is the fourth mode of the major scale."
    let mixolydianText = "The Mixolydian mode follows the pattern: 1, 2, 3, 4, 5, 6, ♭7, and is the fifth mode of the major scale."
    let lydianDomText = "The Lydian Dominant scale follows the pattern: 1, 2, 3, ♯4, 5, 6, ♭7."
    let locrianText = "The Locrian Mode follows the pattern: 1, ♭2,♭3, 4, ♭5, ♭6, ♭7, and is the seventh mode of the major scale."
    
    let chromaticText = "The Chromatic scale is a symmetric scale containing all twelve pitches and is played in ascending or descending half-steps."
    let octaWholeText = "The Octatonic scale (whole-step first) alternates whole-steps and half-steps, and begins with a whole step. It follows the pattern: 1, 2,♭3, 4, ♭5, ♭6, ♮6, 7."
    let octaHalfText = "The Octatonic scale (half-step first) alternates whole-steps and half-steps, and begins with a half step. It follows the pattern: 1, ♭2,♭3, ♮3, ♭5, ♮5, 6, ♭7."
    let wholeToneText = "The Whole-Tone scale is a six-note scale built entirely of whole-steps. It follows the pattern: 1, 2, 3, ♯4, ♯5, ♯6."


     var scaleDescriptionArray:[String] = [majorText, naturalMinorText, harmonicMinorText, melodicMinorText, bluesText, phrygianText, lydianText, mixolydianText, lydianDomText, locrianText, chromaticText, octaWholeText, octaHalfText, wholeToneText]

    func addDescriptionsToCoreData(){
        //Add ScaleDescription Delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let scaleDescriptionEntity = NSEntityDescription.entity(forEntityName: "ScaleDescription", in: context)
        let newDescription = NSManagedObject(entity: scaleDescriptionEntity!, insertInto: context)

        //Adds All Scales Description to Core Data
        newDescription.setValue(scaleDescriptionArray, forKey: "scaleDescriptionText")
        
        //Fetch Scale Descriptions
        
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleDescription")
//        request.returnsObjectsAsFaults = false
//        
//        do {
//            let result = try context.fetch(request)
//            
//            for data in result as! [NSManagedObject] {print(data.value(forKey: "scaleDescriptionText") as Any)}
//            
//        } catch  {
//            print("Failed")
//        }
    }



    

    









