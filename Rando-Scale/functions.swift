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

func getFinalScale(){
    
    var randomScaleType = [String]()
    var finalRandomScale = ""
    
    randomScaleType = [totalScaleArray.randomElement()] as! [String]
    
    
    finalRandomScale = randomScaleType[0]
    
    print(finalRandomScale)
    
    sentScaleText = finalRandomScale
    receivedScaleText = sentScaleText
}

func removeScales(){
    
//    var set1 = Set<<#Element: Hashable#>>(totalScaleArray)
    
    
}
