//
//  SessionModel.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/22/26.
//

import SwiftData
import Foundation

@Model
class SessionLog {
    var sessionName: String
    var highestG: Double
    
    // Raw storage persisted by SwiftData
    @Attribute(.externalStorage) private var dataPointsBlob: Data?

    // Public API used by the rest of the app
    var dataPoints: [DataPoint] {
        get {
            guard let blob = dataPointsBlob else { return [] }
            return (try? JSONDecoder().decode([DataPoint].self, from: blob)) ?? []
        }
        set {
            dataPointsBlob = try? JSONEncoder().encode(newValue)
        }
    }
    
    init(sessionName: String, highestG: Double, dataPoints: [DataPoint]) {
        self.sessionName = sessionName
        self.highestG = highestG
        self.dataPoints = dataPoints
    }
}
