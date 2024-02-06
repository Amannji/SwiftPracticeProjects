//
//  LevelsView.swift
//  VitiligoVoyage
//
//  Created by Aman Gupta on 06/02/24.
//

import SwiftUI

struct LevelsView: View {
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                
                let x1: CGFloat = width * 0.15
                let x2: CGFloat = width * 0.75
                let x3: CGFloat = width * 0.15
                let x4: CGFloat = width * 0.65
                let x5: CGFloat = width * 0.3
                let y: CGFloat = height * 0.15
             
                
                VStack(spacing:0){
                    Stage(color: .skin1,title:"Peace",xPos:x1,yPos:y)
                    Stage(color: .skin2, title:"Acceptance",xPos: x2,yPos:y)
                    Stage(color: .skin3, title:"Hope", xPos: x3, yPos: y)
                    Stage(color: .skin4, title: "Emotional Upheal",xPos:x4,yPos:y)
                    Stage(color: .dullOrange, title:"Shock & Denial", xPos:x5,yPos:y-25)
                }
                
            }
            LevelPath()
                .padding(.bottom,20)
        }
        
    }

}

#Preview {
    LevelsView()
        .ignoresSafeArea()
}


struct Stage:View{
    var color: Color
    var title:String
    var xPos : CGFloat
    var yPos : CGFloat
    var body: some View{
        Rectangle()
            .foregroundColor(color)
            .frame(maxHeight: UIScreen.main.bounds.height / 5)
            .overlay{
                Text(title)
                    .font(.system(size: 60, weight: .semibold))
                    .position(x: xPos,y: yPos)
            }
    }
}
