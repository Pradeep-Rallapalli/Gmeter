//
//  Reticle.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/5/26.
//

import SwiftUI

struct Reticle: View {
    
    var model: MotionModel
   

    @State private var tailPoints: [TailPoint] = []
    
    
    var body: some View {
        ZStack {
            
            //Tail Generation
            ForEach(tailPoints) { tailPoint in
                Circle()
                    .frame(width: Constants.tailDiameter, height: Constants.tailDiameter)
                    .foregroundStyle(Constants.amgRed)
                    .shadow(color: Constants.amgRed.opacity(0.3), radius: 5, x: 0, y: 0)
                    .offset(x: tailPoint.x, y: tailPoint.y)
                
            }
            
            //Reticle
            Circle()
                .frame(width: Constants.reticleDiam, height: Constants.reticleDiam)
                .foregroundStyle(Constants.amgWhite)
                .shadow(color: .red.opacity(0.7), radius: 6, x: 0, y: 0)
                .offset(x: model.pixelX, y: model.pixelY)
        }.onChange(of: [model.pixelX, model.pixelY]) {
            if(tailPoints.count < Constants.tailSize) {
                let newTailPoint = TailPoint(x: model.pixelX, y: model.pixelY)
                tailPoints.append(newTailPoint)
            } else {
                tailPoints.removeFirst()
                let newTailPoint = TailPoint(x: model.pixelX, y: model.pixelY)
                tailPoints.append(newTailPoint)
            }
        }
    }
}

struct TailPoint: Identifiable {
    let id = UUID()
    let x: Double
    let y: Double
}

#Preview {
    Reticle(model: MotionModel())
}
