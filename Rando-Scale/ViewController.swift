//
//  ViewController.swift
//  Rando-Scale
//
//  Created by The Clout on 6/11/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import UIKit
import CoreData

extension CoreDataArrayObj{
    
    var pitches: [String]{
        return pitchesArray as? Array<String> ?? []
    }set{
    pitchesArray = newValue as NSArray
    }



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var noteNameLabel: UILabel!
    @IBOutlet weak var scaleTypeLabel: UILabel!
    @IBOutlet weak var scaleTableView: UITableView!
    
    let scaleTypes = ["Major Scales", "Minor Scales", "Modes", "Symmetrics"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 4
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = scaleTableView.dequeueReusableCell(withIdentifier: "scaleTypeCell")
        
        cell?.textLabel?.text = scaleTypes[indexPath.row]
        cell?.textLabel?.textAlignment = .center
        
        return cell!
        
    }
    

    }

 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scaleTableView.delegate = self
        scaleTableView.dataSource = self
        scaleTableView.tableFooterView = UIView(frame: .zero)
        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return }
//              let managedContext = appDelegate.persistentContainer.viewContext
//              let pitchEntity = NSEntityDescription.entity(forEntityName: "Pitches", in: managedContext)!
//        
//        let pitches = NSManagedObject(entity: pitchEntity, insertInto: managedContext)
//        pitches.value = ["A", "A♭", "B", "B♭", "C", "D", "D♭", "E", "E♭", "F", "G", "G♭"]
//        
//        do{
//            try managedContext.save() 
//        }catch let error as NSError{
//            print("Could Not save. \(error), \(error.userInfo)")
//        }
//        
//        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Pitches")
//        
//        userFetch.fetchLimit = 1
//        userFetch.predicate = NSPredicate(format: "pitch = %@", "A♭")
//        userFetch.sortDescriptors = [NSSortDescriptor.init(key:"pitch", ascending: true)]
//        
//        let pitches = try! managedContext.fetch(userFetch)
//        
//        let aFlat: Pitches = pitches.first as! Pitches
//        
//        print("pitch: \(String(describing: aFlat.pitch))")
//        

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

