//
//  MorphCodeView.swift
//  MindMorph
//
//  Created by Aman Gupta on 10/02/24.
//

import SwiftUI

struct MorphCodeView: View {
    @State var activities = []
    var body: some View {
        ZStack(alignment: .topLeading){
            VStack{
                Text("Run the blocks here")
                    .foregroundColor(Color(.systemGray2))
                HStack{
                    
                    ScrollView(.horizontal){
                     
                    }
                }
            }
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 130,height:50)
                .padding()
                .overlay{
                    HStack{
                        Image(systemName: "arrowtriangle.right.fill")
                            .foregroundColor(.white)
                        Text("Execute")
                            .foregroundColor(.white)
                    }
                }
        }
    }
}

#Preview {
    MorphCodeView()
}


struct ActivityGroupBlock: View{
    var title: String
    var iconName: String
    var color: String
    var body: some View{
        VStack{
            Image(systemName:iconName)
            Text(title)
                .foregroundColor(.white)
                .font(.caption)
            
        }
        .background(Color.black)
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
        
    }
}
