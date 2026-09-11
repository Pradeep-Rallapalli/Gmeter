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
    
    private let windowSize = 8
    
    private var motionManager = CMMotionManager()
    
    var accelY: Double = 0
    var accelX: Double = 0
    
    var accelXBuf: [Double] = []
    var accelYBuf: [Double] = []
    
    var highestG: Double = 0
    var currentG: Double = 0
    
    init() {
        motionManager.deviceMotionUpdateInterval = 1/60
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let newAccel = data?.userAcceleration else { return }
            guard let self else { return }
            
            
            
            
            if(self.accelXBuf.count < windowSize) {
                self.accelXBuf.append(newAccel.x)
            } else {
                self.accelXBuf.removeFirst()
                self.accelXBuf.append(newAccel.x)
            }
            
            if(self.accelYBuf.count < windowSize) {
                self.accelYBuf.append(newAccel.y)
            } else {
                self.accelYBuf.removeFirst()
                self.accelYBuf.append(newAccel.y)
            }
            
            self.accelX = self.accelXBuf.reduce(0, +) / Double(self.windowSize)
            self.accelY = self.accelYBuf.reduce(0, +) / Double(self.windowSize)

            self.currentG = sqrt((self.accelX * self.accelX) + (self.accelY * self.accelY))

            if self.currentG > self.highestG {
                self.highestG = self.currentG
            }
            
            
        }
    }
}
