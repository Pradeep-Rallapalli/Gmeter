//
//  LogGraphView.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/25/26.
//

import SwiftUI
import Charts

struct LogGraphView: View {
    let log: SessionLog

    var body: some View {
        NavigationStack {
            Chart(log.dataPoints) { point in
                LineMark(
                    x: .value("Time", point.time),
                    y: .value("G", point.g)
                ).symbol(by: .value("G force", point.g))
            }
            
            .frame(height: 250)
            .padding()
            .navigationTitle(log.sessionName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
