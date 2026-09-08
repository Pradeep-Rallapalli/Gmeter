//
//  uiConstants.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/6/26.
//

enum Constants {
    static let gaugeDiameter = 300.00
    static let gaugeRadius = gaugeDiameter / 2
    static let gaugeRingThickness = 6.00
    static let gLimit = 0.6
    
    static let reticleDiam = 20.00
    static var reticleScaleFactor: Double {
        gaugeRadius/gLimit
    }
}
