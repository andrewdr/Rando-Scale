//
//  ViewController.swift
//  Rando-Scale
//
//  Created by The Clout on 6/11/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var noteNameLabel: UILabel!
    @IBOutlet weak var scaleTypeLabel: UILabel!
    @IBOutlet weak var scaleTableView: UITableView!

    let pitches:Array = ["A♭", "A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "F♯", "G",]
    let scaleTypes = ["Major Scales", "Minor Scales", "Modes", "Symmetrics"]
    let majorScales:Array = ["Major"]
    let minorScales:Array = ["Natural Minor", "Harmonic Minor", "Melodic Minor", "Blues"]
    let modes:Array = ["Dorian", "Phrygian", "Lydian", "Lydian Dominant", "Mixolydian", "Locrian"]
    let symmetrics:Array = ["Whole Tone", "Chromatic", "Octatonic(W)", "Octatonic(H)"]
    var randomScale = [] as Array
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return scaleTypes.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = scaleTableView.dequeueReusableCell(withIdentifier: "scaleTypeCell")
        
        cell?.textLabel?.text = scaleTypes[indexPath.row]
        cell?.textLabel?.textAlignment = .center
        
        return cell!
        
    }
    
    
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
        
        if randomScale.isEmpty{
            scaleTypeLabel.text = "Major"
        }
        
        do {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleType")
            request.returnsObjectsAsFaults = false
            
            let result = try context.fetch(request)
            
            var majorScaleArray = [] as Array
            var minorScaleArray = [] as Array
            var modesScaleArray = [] as Array
            var symmetricsScaleArray = [] as Array
            
            for data in result as! [NSManagedObject] {majorScaleArray = data.value(forKey: "major") as! [Any]}
            for data in result as! [NSManagedObject] {minorScaleArray = data.value(forKey: "minors") as! [Any]}
            for data in result as! [NSManagedObject] {modesScaleArray = data.value(forKey: "modes") as! [Any]}
            for data in result as! [NSManagedObject] {symmetricsScaleArray = data.value(forKey: "symmetrics") as! [Any]}
            
            
            
            randomScale.append(majorScaleArray)
            randomScale.append(minorScaleArray)
            randomScale.append(modesScaleArray)
            randomScale.append(symmetricsScaleArray)
            
            var selectedScaleArray = [] as Array
            var finalScale = ""

            selectedScaleArray = randomScale.randomElement() as! [String]
            finalScale = selectedScaleArray.randomElement() as! String
            scaleTypeLabel.text = finalScale
            
//            let currentScale = scaleTypeLabel.text
//            var nextScale = selectedScaleArray.randomElement() as! String
//
//            while currentScale == nextScale{
//                nextScale = selectedScaleArray.randomElement() as! String
//            }

            print(finalScale)
            
            } catch  {
                print("Failed")
            }
    }
    
    @IBAction func tableSwitch(_ sender: Any) {
        
//        if randomScale.isEmpty{
//            randomScale.append(minorScales)
//        }else{
//            randomScale.removeAll()
//        }
    
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scaleTableView.delegate = self
        scaleTableView.dataSource = self
        scaleTableView.tableFooterView = UIView(frame: .zero)
        
        clearData(entity: "ScaleType")
        
        
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
        //Clear Core Data
    func clearData(entity: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleType")
        request.returnsObjectsAsFaults = false
        
        let pitchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pitches")
        pitchRequest.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {context.delete(data)}
            
            let pitchResult = try  context.fetch(pitchRequest)
            for data in pitchResult as! [NSManagedObject]{context.delete(data)}
            
        } catch{
            
            print("Deleted all my data")
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

