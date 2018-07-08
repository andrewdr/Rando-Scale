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

var totalScaleArray = [] as Array
var sentScaleText = ""

func getFinalScale(){
    
    var randomScaleType = [] as Array
    var finalRandomScale = ""
    
    randomScaleType = totalScaleArray.randomElement() as! [String]
    finalRandomScale = randomScaleType.randomElement() as! String
    
    sentScaleText = finalRandomScale
    receivedScaleText = sentScaleText
    
    print(finalRandomScale)
    
}

func getSelectedScales(dataKey: String){

    do{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleType")
    request.returnsObjectsAsFaults = false
    
    let result = try context.fetch(request)
    
    var selectedScaleArray = [] as Array
  
    
    for data in result as! [NSManagedObject] {selectedScaleArray = data.value(forKey: dataKey) as! [Any]}
    
    totalScaleArray.append(selectedScaleArray)

        
    }catch{
        print("An Error Ocurred")
    }
}
