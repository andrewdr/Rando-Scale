//
//  ScaleInfoViewController.swift
//  Rando-Scale
//
//  Created by The Clout on 7/11/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import UIKit


class ScaleInfoViewController: UIViewController {
    
    var receivedScaleLabel:String?
    var receivedImage:UIImage?
//    var receivedDescription:String?
    
    @IBOutlet weak var scaleInfoLabel: UILabel!
    @IBOutlet weak var scaleImage: UIImageView!
    @IBOutlet weak var scaleInfoText: UITextView!
    
    
    var imageFileName:String?
    
    func makeLowercase(scaleName:String){
        
        var lowerCaseName:String = "lowercase"
        var fileName:String = "c-major"
        
        lowerCaseName = scaleName.lowercased()
        
        fileName = "c-\(lowerCaseName)"
        
        print(fileName)
    }
    
    func getLabelText(){
        
        if (receivedScaleLabel?.isEmpty)!{
            scaleInfoLabel.text = "Major"
        }else{
            scaleInfoLabel.text = receivedScaleLabel
        }
        
    }
    
    func getDescription(){
        
        var scaleDescription = "Scale Description Here"
        
        scaleDescription = descriptionDictionary[scaleInfoLabel.text!]!
        
        print(scaleDescription)
        
        scaleInfoText.text = scaleDescription
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLowercase(scaleName: receivedScaleLabel!)
        
        
        getLabelText()
        getDescription()
        scaleImage.image = receivedImage
//        scaleInfoText.text = receivedDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
