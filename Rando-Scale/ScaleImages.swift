//
//  ScaleImages.swift
//  Rando-Scale
//
//  Created by The Clout on 7/12/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import Foundation
import UIKit
import CoreData



let majorImage: UIImage = #imageLiteral(resourceName: "c-major")
var majorData: Data = majorImage.pngData()!

let naturalMinorImage:UIImage  = #imageLiteral(resourceName: "c-natural-minor")
let naturalMinorData:Data = naturalMinorImage.pngData()!


let harmonicMinorImage:UIImage  = #imageLiteral(resourceName: "c-harmonic-minor")
let harmonicMinorData:Data = harmonicMinorImage.pngData()!

let melodicMinorImage:UIImage  = #imageLiteral(resourceName: "c-melodic-minor")
let bluesImage:UIImage  = #imageLiteral(resourceName: "blues")
let dorianImage:UIImage  = #imageLiteral(resourceName: "c-dorian")
let phrygianImage:UIImage  = #imageLiteral(resourceName: "c-phrygian")
let lydianImage:UIImage  = #imageLiteral(resourceName: "c-lydian")
let lydianDomImage:UIImage  = #imageLiteral(resourceName: "c-lydian-dominnat")
let mixolydianImage:UIImage  = #imageLiteral(resourceName: "c-mixolydian")
let locrianImage:UIImage  = #imageLiteral(resourceName: "c-locrian")
let chromaticImage:UIImage  = #imageLiteral(resourceName: "chromatic-down")
let ocatonicWholeImage:UIImage  = #imageLiteral(resourceName: "octatonic-whole")
let ocatonicHalfImage:UIImage  = #imageLiteral(resourceName: "octatonic-half")
let wholeToneImage:UIImage  = #imageLiteral(resourceName: "whole-tone")



var scaleImageArray:[Data] = [majorData, naturalMinorData, harmonicMinorData]

func addImagesoCoreData(){
    //Add ScaleDescription Delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let scaleImageEntity = NSEntityDescription.entity(forEntityName: "ScaleImages", in: context)
    let newImage = NSManagedObject(entity: scaleImageEntity!, insertInto: context)
    
    //Adds All Scales Description to Core Data
    newImage.setValue(majorData, forKey: "scaleImage")
    
}


