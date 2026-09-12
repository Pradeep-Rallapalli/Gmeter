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
    let midAngles = [45, 135, 225, 315]
    let ringThickness = Constants.gaugeRingThickness
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: ringDiam, height: 1)
            Rectangle()
                .frame(width: 1, height: ringDiam)
            Circle()
                .strokeBorder(
                        LinearGradient(
                            colors: [
                                Color(white: 0.95),  // bright highlight
                                Color(white: 0.55),  // mid gray
                                Color(white: 0.85),  // secondary highlight
                                Color(white: 0.35)   // shadow side
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: Constants.gaugeRingThickness
                    )
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
                } else if(midAngles.contains(angle)) {
                    Rectangle()
                        .frame(width: 2, height: Constants.gaugeDiameter)
                        .rotationEffect(.degrees(Double(angle)))
                }else {
                    

                }
            }
            
            ForEach(1..<3, id: \.self) {index in
                    let newIndex = Double(index)
                Circle()
                    .stroke(lineWidth: 3)
                    .frame(width: (Constants.gaugeRadius/newIndex))
                    
            }
            Text("G-Force")
                .font(.system(size: 16, weight: .heavy))
                .italic()
                .foregroundStyle(Constants.amgAmber)
                .shadow(color: Color.yellow, radius: 6)
                .offset(y: Constants.gaugeRadius + 25)
        }
    }
}

#Preview {
    GaugeRing()
}
