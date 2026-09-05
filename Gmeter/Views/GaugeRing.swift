//
//  GaugeRing.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/5/26.
//

import SwiftUI

struct GaugeRing: View {
    let ringDiam = 300.00
    let labelOffset = 30.00
    let gLimit: String
    let criticalAngles = [0, 90, 180, 270]
    let ringThickness = 6.00
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: ringDiam, height: 1)
            Rectangle()
                .frame(width: 1, height: ringDiam)
            Circle()
                .stroke(Color.gray, lineWidth: ringThickness)
                .frame(width: ringDiam, height: ringDiam)
            
            ForEach(Array(stride(from: 0, to: 360, by: 5)), id: \.self) { angle in
                if(criticalAngles.contains(angle)) {
                    Rectangle()
                        .frame(width: 4, height: 15)
                        .offset(y: -ringDiam/2 + 5)
                        .rotationEffect(.degrees(Double(angle)))
                    
                    Text(gLimit)
                        .font(.system(size: 25))
                        .offset(y: -ringDiam/2 + labelOffset)
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
    GaugeRing(gLimit: "0.6")
}
