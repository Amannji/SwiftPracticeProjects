//
//  WatchlistView.swift
//  ZerodhaClone
//
//  Created by Aman Gupta on 18/01/24.
//

import SwiftUI

struct WatchlistView: View {
    @Binding var showOverView: Bool
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    HStack{
                        Text("Watchlist")
                            .font(.system(size: 30, weight:.bold, design: .rounded))
                            
                        Spacer()
                        Image(systemName:"chevron.down")
                            .font(.system(size:30,weight: .bold))
                            .onTapGesture {
                                showOverView = true
                            }
                    }
                    .padding(.horizontal,20)
                    Spacer()
                }
                .background(
                    Color(.white)
                )
                
    
            }
            
            
            }
        
        
        
    }
}

#Preview {
    WatchlistView(showOverView: .constant(false))
}
