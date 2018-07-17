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
    
    @IBOutlet weak var scaleInfoLabel: UILabel!
    @IBOutlet weak var scaleImage: UIImageView!
    @IBOutlet weak var scaleInfoText: UITextView!
    
    
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
        scaleInfoText.text = scaleDescription
    }
    
    func getImages(){
        var scaleImageLocal:UIImage = #imageLiteral(resourceName: "c-major")
        scaleImageLocal = imageDictionary[scaleInfoLabel.text!]!
        scaleImage.image = scaleImageLocal
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLabelText()
        getDescription()
        getImages()

    }
    
}
