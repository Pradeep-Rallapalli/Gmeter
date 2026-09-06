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
    
    var accelX: Double {motionManager.accelX}
    var accelY: Double {motionManager.accelY}
    
    var currentG: Double {motionManager.currentG}
    var highestG: Double {motionManager.highestG}
    
}


