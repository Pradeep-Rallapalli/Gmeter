//
//  ContentView.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/4/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.modelContext) private var context
    @State private var model = MotionModel()
    @State var isOn = false
    @State var highestG = 0.0
    @State var logStore: SessionLogStore?
    var body: some View {
        VStack {
            ZStack{
                GaugeRing()
                Reticle(model: model)
            }
            
            Text("Highest G: \(model.highestG, specifier: "%.2f")").padding(.top, 20)
            
            Button(isOn ? "On" : "OFF") {
                isOn.toggle()
                if isOn {
                    Task {
                         await logStore?.startLogging()
                    }
                } else {
                    logStore?.stopLogging()
                }
            }
            
        }
        .onAppear {
            if logStore == nil {
                logStore = SessionLogStore(sessionName: "New", context: context, motionModel: model)
            }
            UIApplication.shared.isIdleTimerDisabled = true
        }.onDisappear {
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
}

#Preview {
    ContentView()
}


