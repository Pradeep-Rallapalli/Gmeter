//
//  MotionModel.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/5/26.
//

import Foundation
import CoreMotion

@Observable
class MotionModel {
    
    let motionManager = MotionManager()
    let gLimit = Constants.gLimit
    
    private var accelX: Double {motionManager.accelX}
    private var accelY: Double {motionManager.accelY}
    
    var currentG: Double {motionManager.currentG}
    var highestG: Double {motionManager.highestG}
    
    var pixelX: Double {
        let value = accelX * Constants.reticleScaleFactor
        //print("pixelX = \(value)")
        return value
    }
    var pixelY: Double {
        let value = (accelY * Constants.reticleScaleFactor) * -1
        //print("pixelY = \(value)")
        return value
    }
    
    func startMotionUpdates() {
        motionManager.cmManager.startDeviceMotionUpdates()
    }
    
    func stopMotionUpdates() {
        motionManager.cmManager.stopDeviceMotionUpdates()
    }
}
    
   
    
    



