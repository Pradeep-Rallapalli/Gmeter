//
//  ContentView.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/4/26.
//

import SwiftUI

struct ContentView: View {
    @State private var model = MotionModel()
    @State var highestG = 0.0
    var body: some View {
        ZStack{
            GaugeRing(gLimit: String(model.gLimit))
        }
    }
}

#Preview {
    ContentView()
}


