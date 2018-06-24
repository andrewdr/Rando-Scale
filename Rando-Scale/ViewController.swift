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
    
    let scaleTypes = ["Major Scales", "Minor Scales", "Modes", "Symmetrics"]
    let minorScales = ["Natural Minor", "Harmonic Minor", "Melodic Minor", "Blues"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 4
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = scaleTableView.dequeueReusableCell(withIdentifier: "scaleTypeCell")
        
        cell?.textLabel?.text = scaleTypes[indexPath.row]
        cell?.textLabel?.textAlignment = .center
        
        return cell!
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        scaleTableView.delegate = self
        scaleTableView.dataSource = self
        scaleTableView.tableFooterView = UIView(frame: .zero)
        
        clearData(entity: "ScaleType")
        

        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let scaleTypeEntity = NSEntityDescription.entity(forEntityName: "ScaleType", in: context)
        let newScale = NSManagedObject(entity: scaleTypeEntity!, insertInto: context)
        
        newScale.setValue("Major", forKey: "major")
        
        do {
            try context.save()
        } catch {
            print("Failed Saving")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleType")
        request.returnsObjectsAsFaults = false
        
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {print(data.value(forKey: "major") as! String)}
        } catch  {
            print("Failed")
        }
        
         
    }
    
    func clearData(entity: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ScaleType")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {context.delete(data)}
        } catch{
            
            print("Deleted all my data")
            
        }
    }
    

    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

