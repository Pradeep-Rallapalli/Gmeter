//
//  uiConstants.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/6/26.
//
import SwiftUI

enum Constants {
    static let gaugeDiameter = 370.00
    static let gaugeRadius = gaugeDiameter / 2
    static let gaugeRingThickness = 16.0
    static let gLimit = 0.8
    
    static let reticleDiam = 15.00
    static var reticleScaleFactor: Double {
        gaugeRadius/gLimit
    }
    
    static let tailSize = 80
    static let tailDiameter = 8.00
    static let pointRemoveDelay = 0.2
    
    static let amgRed = Color(red: 200 / 255, green: 30 / 255, blue: 30 / 255)
    static let amgWhite = Color(red: 245 / 255, green: 240 / 255, blue: 225 / 255)
    static let amgAmber = Color(red: 230 / 255, green: 160 / 255, blue: 40 / 255)


}
