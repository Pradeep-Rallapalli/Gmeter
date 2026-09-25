//
//  SessionLogStore.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/22/26.
//


import Foundation
import SwiftData

struct DataPoint: Codable, Hashable, Identifiable {
    let id: UUID
    let time: TimeInterval
    let g: Double

    init(time: TimeInterval, g: Double) {
        self.id = UUID()
        self.time = time
        self.g = g
    }
}

enum SessionStates {
    case idle
    case Logging
    case finishedLogging
}

@Observable
class SessionLogStore {
    
    private let context: ModelContext
    private let motionModel: MotionModel
    var sessionState = SessionStates.idle
    
    var sessionName: String
    var highestG = 0.0
    var dataPoints: [DataPoint] = []
    
    init(sessionName: String, context: ModelContext, motionModel: MotionModel) {
        self.sessionName = sessionName
        self.context = context
        self.motionModel = motionModel
    }
    
    func startLogging() async {
        sessionState = .Logging
        let clock = ContinuousClock()
        let start = clock.now
        while sessionState == .Logging {
            let elapsed = start.duration(to: clock.now)
            let timeSec = Double(elapsed.components.seconds) + Double(elapsed.components.attoseconds) / 1_000_000_000_000_000_000
            dataPoints.append(DataPoint(time: timeSec, g: motionModel.currentG))
            print("DataPoint Count: ")
            print(dataPoints.count)
            highestG = motionModel.highestG
            try? await Task.sleep(nanoseconds: UInt64(5_000_000))
        }
    }
    
    func stopLogging() {
        print("Stopped logging")
        sessionState = .finishedLogging
        let sessionLog = SessionLog(sessionName: sessionName, highestG: highestG, dataPoints: dataPoints)
        context.insert(sessionLog)
    }
    
}
