//
//  LevelPath.swift
//  VitiligoVoyage
//
//  Created by Aman Gupta on 06/02/24.
//

import SwiftUI

struct LevelPath: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                
                
                let x2: CGFloat = width * 0.2
                let x3: CGFloat = width * 0.8
                
                
                let y1: CGFloat = height * 0.9
                let y2: CGFloat = height * 0.85
                let y3: CGFloat = height * 0.65
                let y4: CGFloat = height * 0.45
                let y5: CGFloat = height * 0.25
                let y6: CGFloat = height * 0.15
                
                path.move(to: CGPoint(x: x3, y: y1))
                path.addLine(to: CGPoint(x: x3, y: y2))
                path.addLine(to: CGPoint(x: x2, y: y2))
                path.addLine(to: CGPoint(x: x2, y: y3))
                path.addLine(to: CGPoint(x: x3, y: y3))
                path.addLine(to: CGPoint(x: x3, y: y4))
                path.addLine(to: CGPoint(x: x2, y: y4))
                path.addLine(to: CGPoint(x: x2, y: y5))
                path.addLine(to: CGPoint(x: x3, y: y5))
                path.addLine(to: CGPoint(x: x3, y: y6))
               
                
               
            }
            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round,lineJoin: .round))
            .opacity(0.7)
        }

        
    }
}

#Preview {
    LevelPath()
}
