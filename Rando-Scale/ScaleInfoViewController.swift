//
//  ScaleInfoViewController.swift
//  Rando-Scale
//
//  Created by The Clout on 7/11/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import UIKit


class ScaleInfoViewController: UIViewController {
    
    var receivedImage:UIImage?
    
    @IBOutlet weak var scaleInfoLabel: UILabel!
    @IBOutlet weak var scaleImage: UIImageView!
    @IBOutlet weak var scaleInfoText: UITextView!
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scaleInfoText.text = majorText
        scaleImage.image = receivedImage
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
