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
    
    let pitches = ["A♭", "A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "F♯", "G",]
    let scaleTypes = ["Major Scales", "Minor Scales", "Modes", "Symmetrics"]
    let majorScales:NSArray = ["Major"]
    let minorScales:NSArray = ["Natural Minor", "Harmonic Minor", "Melodic Minor", "Blues"]
    let modes:NSArray = ["Dorian", "Phrygian", "Lydian", "Lydian Dominant", "Mixolydian", "Locrian"]
    let symmetrics:NSArray = ["Whole Tone", "Chromatic", "Octatonic(W)", "Octatonic(H)"]
    
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
        
    }
    
    func getRandomNote(){
    
        noteNameLabel.text = pitches.randomElement()
        
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
            
            for data in result as! [NSManagedObject] {print(data.value(forKey: "major") as! NSArray)}
            for data in result as! [NSManagedObject] {print(data.value(forKey: "minors") as! NSArray)}
            for data in result as! [NSManagedObject] {print(data.value(forKey: "modes") as! NSArray)}
            for data in result as! [NSManagedObject] {print(data.value(forKey: "symmetrics") as! NSArray)}
            
            let pitchResult = try pitchContext.fetch(pitchRequest)
            for data in pitchResult as! [NSManagedObject] {print(data.value(forKey: "pitch") as! NSArray)}
            
            
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

