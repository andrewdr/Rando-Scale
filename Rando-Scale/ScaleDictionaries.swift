//
//  ScaleDictionaries.swift
//  Rando-Scale
//
//  Created by The Clout on 7/17/18.
//  Copyright © 2018 Draper Web Services. All rights reserved.
//

import Foundation
import UIKit

var descriptionDictionary =
    ["Major": "\(majorText)",
        "Natural Minor": "\(naturalMinorText)",
        "Harmonic Minor": "\(harmonicMinorText)",
        "Melodic Minor": "\(melodicMinorText)",
        "Blues": "\(bluesText)",
        "Dorian": "\(dorianText)",
        "Phrygian": "\(phrygianText)",
        "Lydian": "\(lydianText)",
        "Mixolydian": "\(mixolydianText)",
        "Lydian Dominant": "\(lydianDomText)",
        "Locrian": "\(locrianText)",
        "Chromatic": "\(chromaticText)",
        "Octatonic(W)": "\(octaWholeText)",
        "Octatonic(H)": "\(octaHalfText)",
        "Whole Tone": "\(wholeToneText)"]

var imageDictionary:[String: UIImage] =
    ["Major": #imageLiteral(resourceName: "c-major"),
     "Natural Minor": #imageLiteral(resourceName: "c-natural-minor"),
     "Harmonic Minor": #imageLiteral(resourceName: "c-harmonic-minor"),
     "Melodic Minor": #imageLiteral(resourceName: "c-melodic-minor"),
     "Blues": #imageLiteral(resourceName: "blues"),
     "Dorian": #imageLiteral(resourceName: "c-dorian"),
     "Phrygian": #imageLiteral(resourceName: "c-phrygian"),
     "Lydian": #imageLiteral(resourceName: "c-lydian"),
     "Mixolydian": #imageLiteral(resourceName: "c-mixolydian"),
     "Lydian Dominant": #imageLiteral(resourceName: "c-lydian-dominnat"),
     "Locrian": #imageLiteral(resourceName: "c-locrian"),
     "Chromatic": #imageLiteral(resourceName: "chromatic-down"),
     "Octatonic(W)": #imageLiteral(resourceName: "octatonic-whole"),
     "Octatonic(H)": #imageLiteral(resourceName: "octatonic-half"),
     "Whole Tone": #imageLiteral(resourceName: "whole-tone")]
