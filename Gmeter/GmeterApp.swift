//
//  GmeterApp.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/4/26.
//

import SwiftUI
import SwiftData

@main
struct GmeterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: SessionLog.self)
    }
}
