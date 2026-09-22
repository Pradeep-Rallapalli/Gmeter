//
//  SessionModel.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/22/26.
//

import SwiftData

@Model
class SessionLog {
    var sessionName: String
    var highestG: Double
    var dataPoints: [Double]
    
    init(sessionName: String, highestG: Double, dataPoints: [Double]) {
        self.sessionName = sessionName
        self.highestG = highestG
        self.dataPoints = dataPoints
    }
}
