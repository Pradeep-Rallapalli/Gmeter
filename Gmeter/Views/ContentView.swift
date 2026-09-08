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
        VStack {
            ZStack{
                GaugeRing()
                Reticle(model: model)
            }
            
            Text("Highest G: \(model.highestG, specifier: "%.2f")").padding(.top, 20)
            
        }
    }
}

#Preview {
    ContentView()
}


