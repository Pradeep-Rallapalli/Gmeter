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
    @State var isShowingSessionNameSheet = false
    @State var sessionName = ""
    var body: some View {
        NavigationStack {
            VStack {
                ZStack{
                    GaugeRing()
                    Reticle(model: model)
                }
                
                Text("Highest G: \(model.highestG, specifier: "%.2f")").padding(.top, 20)
                
                Button(isOn ? "On" : "OFF") {
                    if !isOn {
                        isShowingSessionNameSheet = true
                    } else {
                        isOn = false
                        logStore?.stopLogging()
                    }
                }
                .alert("Enter Name", isPresented: $isShowingSessionNameSheet) {
                    TextField("Session name", text: $sessionName)
                    
                    Button("Finish") {
                        logStore = SessionLogStore(
                            sessionName: sessionName,
                            context: context,
                            motionModel: model
                        )
                        
                        isOn = true
                        
                        Task {
                            await logStore?.startLogging()
                        }
                    }
                } message: {
                    Text("Enter a name for this session:")
                }
                
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        NavigationLink(destination: LogView()) {
                            Text("Logs")
                        }
                    }
                }
                .onAppear {
                    UIApplication.shared.isIdleTimerDisabled = true
                }.onDisappear {
                    UIApplication.shared.isIdleTimerDisabled = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


