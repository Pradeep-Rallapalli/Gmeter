//
//  GaugeRing.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/5/26.
//

import SwiftUI

struct GaugeRing: View {
    let ringDiam = Constants.gaugeDiameter
    let labelOffset = 30.00
    let gLimit = String(Constants.gLimit)
    let criticalAngles = [0, 90, 180, 270]
    let ringThickness = Constants.gaugeRingThickness
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: ringDiam, height: 1)
            Rectangle()
                .frame(width: 1, height: ringDiam)
            Circle()
                .stroke(Color.gray, lineWidth: ringThickness)
                .frame(width: ringDiam, height: ringDiam)
                .shadow(radius: 2)
            
            ForEach(Array(stride(from: 0, to: 360, by: 5)), id: \.self) { angle in
                if(criticalAngles.contains(angle)) {
                    Rectangle()
                        .frame(width: 4, height: 15)
                        .offset(y: -ringDiam/2 + 5)
                        .rotationEffect(.degrees(Double(angle)))
                    
                    Text(gLimit)
                        .font(.system(size: 25))
                        .offset(y: -ringDiam/2 - labelOffset)
                        .rotationEffect(.degrees(Double(angle)))
                        .rotationEffect(.degrees(-Double(angle)))
                } else {
                    Rectangle()
                        .frame(width: 2, height: 8)
                        .offset(y: -ringDiam/2 + ringThickness)
                        .rotationEffect(.degrees(Double(angle)))

                }
            }
            
        }
    }
}

#Preview {
    GaugeRing()
}
