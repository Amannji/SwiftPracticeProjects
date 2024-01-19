//
//  WatchlistView.swift
//  ZerodhaClone
//
//  Created by Aman Gupta on 18/01/24.
//

import SwiftUI

struct CardItem: Identifiable{
    let id: Int
}

struct WatchlistView: View {
    let cards = [CardItem(id:0),CardItem(id:1), CardItem(id:2),CardItem(id:3)]
    @State var listChoice:String = ""
    @State private var selectedTabIndex:Int = 1
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:25){
                        ForEach(1...7, id: \.self){ i in
                            Text("Watchlist \(i)")
                                .foregroundColor(selectedTabIndex == i ? Color.blue : Color.primary)
                                .onTapGesture{
                                    withAnimation{
                                        selectedTabIndex = i
                                    }
                                }
                            
                        }
                        
                    }
                    .padding()
                    GeometryReader{ geometry in
                        Rectangle()
                            .foregroundColor(Color.blue)
                            .frame(width: geometry.size.width/7,height: 3)
                            .offset(x:CGFloat(selectedTabIndex - 1)*(geometry.size.width/7),y:-15)
                            .animation(.easeInOut,value: selectedTabIndex)
                        
                    }
                    
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack{
                        ForEach(1...7, id: \.self){ i in
                            RoundedRectangle(cornerRadius:10.0)
                                .fill(.ultraThinMaterial)
                                .padding(.horizontal,15)
                                .containerRelativeFrame(.horizontal)
                                .id(i)
                        }
                        
                    }
                }
                .onAppear{
                    scrollToCardView(id: selectedTabIndex)
                }
                
            }
            
           
        }
    }
    
    private func scrollToCardView(id: Int){
        withAnimation{
            listChoice = "Watchlist \(id)"
        }
    }
    
   
}

#Preview {
    WatchlistView()
}




