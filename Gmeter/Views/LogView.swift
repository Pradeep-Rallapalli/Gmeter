//
//  LogView.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/24/26.
//

import SwiftUI
import SwiftData
import Charts

struct LogView: View {
    @Query private var logs: [SessionLog]

    @State private var selectedLog: SessionLog?

    var body: some View {
        List {
            ForEach(logs) { log in
                Button {
                    selectedLog = log
                    print(log.dataPoints.first)
                } label: {
                    HStack {
                        Text(log.sessionName)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                }
                .buttonStyle(.plain)
                
            }
        }
        .sheet(item: $selectedLog) { log in
            LogGraphView(log: log)
        }
    }
}




#Preview {
    LogView()
}
