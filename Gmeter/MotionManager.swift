//
//  MotionManager.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/4/26.
//

import Foundation
import CoreMotion

@Observable
class MotionManager {
    
    var motionManager = CMMotionManager()
    
    var accelY: Double = 0
    var accelX: Double = 0
    
    init() {
        motionManager.deviceMotionUpdateInterval = 1/60
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            
            guard let newAccel = data?.userAcceleration else { return }
                
            self?.accelX = newAccel.x
            self?.accelY = newAccel.y
        }
    }
}
