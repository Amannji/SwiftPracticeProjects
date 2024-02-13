//
//  HomeView.swift
//  VitiligoVoyage
//
//  Created by Aman Gupta on 06/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Vitiligo Voyage")
                    .font(.system(size:70,weight:.bold, design: .rounded))
                    .foregroundColor(.dullBlue)
                    .padding(.top,150)
                Spacer()
                ZStack{
                    Image(.base)
                        .resizable()
                        .frame(maxWidth: .infinity,maxHeight: UIScreen.main.bounds.height )
                        
                    Buttons
                        .padding(.top,200)
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color.skin1)
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    HomeView()
}


extension HomeView{
    private var Buttons: some View{
        GeometryReader{ geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            HStack(spacing: 50){
                
                HStack{
                    Image(systemName:"play.circle")
                        .resizable()
                        .frame(width:width/7,height:height/7)
                        .foregroundColor(.skin1)
                    Text("Play")
                        .font(.system(size: width/12))
                        .foregroundColor(.skin1)
                }
                .onTapGesture {
                    
                }
                
                HStack{
                    Image(systemName:"arrow.clockwise.circle")
                        .resizable()
                        .foregroundColor(.skin1)
                        .frame(width:width/7,height:height/7)
                    Text("Restart")
                        .font(.system(size: width/12))
                        .foregroundColor(Color.skin1)
                }
            }
            .offset(x:width/20,y:height/1.75)
            .padding()
            
            
        }
    }
}
