//
//  SessionLogStore.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/22/26.
//


import Foundation
import SwiftData

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
    var dataPoints: [Double] = []
    
    init(sessionName: String, context: ModelContext, motionModel: MotionModel) {
        self.sessionName = sessionName
        self.context = context
        self.motionModel = motionModel
    }
    
    func startLogging() async {
        sessionState = .Logging
        while sessionState == .Logging {
            dataPoints.append(motionModel.currentG)
            highestG = motionModel.highestG
            try? await Task.sleep(nanoseconds: 1_000_000)
        }
    }
    
    func stopLogging() {
        sessionState = .finishedLogging
        let sessionLog = SessionLog(sessionName: sessionName, highestG: highestG, dataPoints: dataPoints)
        context.insert(sessionLog)
        dataPoints.removeAll()
    }
    
}
