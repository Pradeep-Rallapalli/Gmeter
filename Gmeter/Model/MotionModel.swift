//
//  MotionModel.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/5/26.
//

import Foundation

@Observable
class MotionModel {
    
    let motionManager = MotionManager()
    let gLimit = 0.6
    
    var roundedAccelX: Double {(motionManager.accelX * 100).rounded() / 100}
    var roundedAccelY: Double {(motionManager.accelY * 100).rounded() / 100}
    var gVector: Double { sqrt((motionManager.accelX * motionManager.accelX) + (motionManager.accelY * motionManager.accelY)) }
    
    private var previousG = 0.0
    
    var highestG: Double {
        if(gVector > previousG) {
            previousG = gVector
        }
        return previousG
    }
    
}


