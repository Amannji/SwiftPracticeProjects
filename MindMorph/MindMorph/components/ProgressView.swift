//
//  ProgressView.swift
//  MindMorph
//
//  Created by Aman Gupta on 21/02/24.
//

import SwiftUI

struct ProgressView: View {
    var text: String
    var progress: Float
    var change: Float?
        
    var body: some View {
        GeometryReader{ geometry in
            HStack{
                Text(text)
                    .font(.title.bold())
                Spacer()
                ZStack(alignment:.leading){
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(Color(.green))
                        .opacity(0.2)
                        .frame(width:geometry.size.width/2,height: 15)
                        
                        
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(Color.green)
                        .frame(width: geometry.size.width/2*CGFloat(progress),height:16)
                }
                
                
                Text(String(format:"%.0f%%",progress*100))
                    .font(.title3.bold())
                if change != nil{
                    HStack{
                        Image(systemName: "triangle.fill")
                            .rotationEffect( change! > 0 ? .degrees(0) : .degrees(180))
                        Text(String(format:"%.0f%",(abs(change ?? 0)*100)))
                            .font(.title3.bold())
                    }
                    .foregroundColor(change! > 0 ? .green : .red)
                        .padding()
                }
            }
            
        }
        
    }
    
    
}


#Preview {
    ProgressView(text:"Dopamine",progress:0.3,change:0.2)
}
