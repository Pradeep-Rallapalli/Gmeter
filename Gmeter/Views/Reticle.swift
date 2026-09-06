//
//  Reticle.swift
//  Gmeter
//
//  Created by Pradeep Rallapalli on 9/5/26.
//

import SwiftUI

struct Reticle: View {
    
    var model: MotionModel
    private let reticleDiam = 20.0
    private let customYellow = Color(red: 244 / 255, green: 240 / 255, blue: 0 / 255)
    var body: some View {
        Circle()
            .frame(width: reticleDiam, height: reticleDiam)
            .foregroundStyle(customYellow)
            .shadow(color: customYellow.opacity(0.6), radius: 5, x: 0, y: 0)
            .offset(x: model.accelX * 150, y: (model.accelY * 150) * -1)
    }
}

#Preview {
    Reticle(model: MotionModel())
}
