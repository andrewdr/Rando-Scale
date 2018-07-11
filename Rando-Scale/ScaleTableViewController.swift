//
//  ScaleTableViewController.swift
//  Rando-Scale
//
//  Created by The Clout on 7/7/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ScaleTableViewController: UITableViewController {

    @IBOutlet weak var majorSwitich: UISwitch!
    @IBOutlet weak var minorSwitch: UISwitch!
    @IBOutlet weak var modesSwitch: UISwitch!
    @IBOutlet weak var symmetricsSwitch: UISwitch!
    
    
    @IBAction func addMajors(_ sender: Any) {
        if majorSwitich.isOn{
            getSelectedScales(dataKey: "major")
        }
    }
    @IBAction func addMinors(_ sender: Any) {
        if minorSwitch.isOn{
            getSelectedScales(dataKey: "minors")
        }
    }
    
    @IBAction func addModes(_ sender: Any) {
        if modesSwitch.isOn{
            getSelectedScales(dataKey: "modes")
        }
    }
    
    @IBAction func addSymmetrics(_ sender: Any) {
        if symmetricsSwitch.isOn{
            getSelectedScales(dataKey: "symmetrics")
        }
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        


    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 4
//    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        cell.textLabel?.text = "major"
//
//        return cell
//    }
//

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
