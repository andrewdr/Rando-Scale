//
//  functions.swift
//  Rando-Scale
//
//  Created by The Clout on 6/28/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import Foundation
import UIKit
import CoreData

var totalScaleArray = [String]()
var sentScaleText = ""

//Add possible scales to array via table switches
func getSelectedScales(dataKey: String){

    do{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleType")
    request.returnsObjectsAsFaults = false
    
    let result = try context.fetch(request)
    
    var selectedScaleArray = [String]()
  
    
        for data in result as! [NSManagedObject] {selectedScaleArray = data.value(forKey: dataKey) as! [String]}
    
    totalScaleArray.append(contentsOf: selectedScaleArray)
        
        print(totalScaleArray)

        
    }catch{
        print("An Error Ocurred")
    }
}

// Select Final Scale from Randomized Array
func getFinalScale(){
    
    var randomScaleType = [String]()
    var finalRandomScale = ""
    
    randomScaleType = [totalScaleArray.randomElement()] as! [String]
    
    
    finalRandomScale = randomScaleType[0]
    
    print(finalRandomScale)
    
    sentScaleText = finalRandomScale
    receivedScaleText = sentScaleText
}

// Remove Scales from Randomized Array
func removeScales(dataKey: String){
    
    do{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleType")
        
        request.returnsObjectsAsFaults = false
        let result = try context.fetch(request)
        
        var selectedScaleArray = [String]()
        
        
        for data in result as! [NSManagedObject] {selectedScaleArray = data.value(forKey: dataKey) as! [String]}
        
        
        let selectedSet = Set(selectedScaleArray)
        var arraySet2 = Set(totalScaleArray)
        
        
        
        arraySet2.subtract(selectedSet)
        
        
        totalScaleArray = Array(arraySet2)
        
        print(totalScaleArray)
        
        
    }catch{
        print("An Error Ocurred")
    }
    
//    var set1
    
    
}

//Clear Core Data
func clearData(entity: String){
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleType")
    request.returnsObjectsAsFaults = false
    
    let pitchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pitches")
    pitchRequest.returnsObjectsAsFaults = false
    
    let descriptionRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleDescription")
    descriptionRequest.returnsObjectsAsFaults = false
    
    let imageRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleImages")
    imageRequest.returnsObjectsAsFaults = false
    
    do{
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {context.delete(data)}
        
        let pitchResult = try  context.fetch(pitchRequest)
        for data in pitchResult as! [NSManagedObject]{context.delete(data)}
        
        let descriptionResult = try  context.fetch(pitchRequest)
        for data in descriptionResult as! [NSManagedObject]{context.delete(data)}
        
        let imageResult = try context.fetch(imageRequest)
        for data in imageResult as! [NSManagedObject]{context.delete(data)}
        
    } catch{
        
        print("Failed")
        
    }
}
