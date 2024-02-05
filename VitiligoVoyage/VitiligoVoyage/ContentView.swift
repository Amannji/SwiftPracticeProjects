//
//  ContentView.swift
//  VitiligoVoyage
//
//  Created by Aman Gupta on 05/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment:.leading){
            Text("Vitiligo Voyage")
                .font(.system(size:40,weight:.bold, design: .rounded))
            Spacer()
            HStack{
                HStack{
                    Image(systemName:"play.circle")
                        .resizable()
                        .frame(width:50,height:50)
                    Text("Play")
                        .font(.system(size: 30))
                }
                
                HStack{
                    Image(systemName:"arrow.clockwise.circle")
                        .resizable()
                        .frame(width:50,height:50)
                    Text("Restart")
                        .font(.system(size: 30))
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.skin1)
        
        
    }
        
}

#Preview {
    ContentView()
}
