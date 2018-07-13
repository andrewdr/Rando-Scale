//
//  ViewController.swift
//  Rando-Scale
//
//  Created by The Clout on 6/11/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import UIKit
import CoreData

var receivedScaleText = ""




    class ViewController: UIViewController{
        

        
    
    @IBOutlet weak var noteNameLabel: UILabel!
    @IBOutlet weak var scaleTypeLabel: UILabel!
    

    let pitches:Array = ["A♭", "A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "F♯", "G",]
    let scaleTypes = ["Major Scales", "Minor Scales", "Modes", "Symmetrics"]
    let majorScales:Array = ["Major"]
    let minorScales:Array = ["Natural Minor", "Harmonic Minor", "Melodic Minor", "Blues"]
    let modes:Array = ["Dorian", "Phrygian", "Lydian", "Lydian Dominant", "Mixolydian", "Locrian"]
    let symmetrics:Array = ["Whole Tone", "Chromatic", "Octatonic(W)", "Octatonic(H)"]
    var randomScale = [] as Array
    
    
    @IBAction func randomScaleButton(_ sender: Any) {
        getRandomNote()
        getScales()
    }
    
    //Get Randome Note
    func getRandomNote(){
        
        let currentPitch = noteNameLabel.text
        var nextPitch = pitches.randomElement()
        
        while currentPitch == nextPitch {
            nextPitch = pitches.randomElement()
        }
        
        noteNameLabel.text = nextPitch
    }
    
    func getScales(){
        
        getFinalScale()
        scaleTypeLabel.text = receivedScaleText
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        clearData(entity: "ScaleType")
        
        addDescriptionsToCoreData()
        addImagesoCoreData()
        
        
        //Add Scale Delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let scaleTypeEntity = NSEntityDescription.entity(forEntityName: "ScaleType", in: context)
        let newScale = NSManagedObject(entity: scaleTypeEntity!, insertInto: context)
        
        //Adds All ScalesTypes to Core Data
        newScale.setValue(majorScales, forKey: "major")
        newScale.setValue(minorScales, forKey: "minors")
        newScale.setValue(modes, forKey: "modes")
        newScale.setValue(symmetrics, forKey: "symmetrics")
        
        //Adds Pitch Delegate
        let pitchContext = appDelegate.persistentContainer.viewContext
        let pitchEntity = NSEntityDescription.entity(forEntityName: "Pitches", in: pitchContext)
        let allPitches = NSManagedObject(entity: pitchEntity!, insertInto: pitchContext)
        
        //Adds all pitches to Core Data
        allPitches.setValue(pitches, forKey: "pitch")
        
        do {
            try context.save()
            try pitchContext.save()
        } catch {
            print("Failed Saving")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleType")
        request.returnsObjectsAsFaults = false
        
        let pitchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pitches")
        pitchRequest.returnsObjectsAsFaults = false
        
        //Fetch Scale Types and Pitches
        do {
            let result = try context.fetch(request)
            
            for data in result as! [NSManagedObject] {print(data.value(forKey: "major") as Any)}
            for data in result as! [NSManagedObject] {print(data.value(forKey: "minors") as Any)}
            for data in result as! [NSManagedObject] {print(data.value(forKey: "modes") as Any)}
            for data in result as! [NSManagedObject] {print(data.value(forKey: "symmetrics") as Any)}
            
            let pitchResult = try pitchContext.fetch(pitchRequest)
            for data in pitchResult as! [NSManagedObject] {print(data.value(forKey: "pitch") as Any)}
            
            
        } catch  {
            print("Failed")
        }

    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "scaleInfo"{
                
                let ScaleInfo = segue.destination as! ScaleInfoViewController
                ScaleInfo.receivedImage = sendImage
                ScaleInfo.receivedDescription = sendDescription
                
            }
            
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

