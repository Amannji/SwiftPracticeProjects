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
    @State  var selectedTabIndex:Int = 1
    @State var listChoice: Int = 1
    @State var names:[String] = ["ICICI BANK","SBIN","TATAPOWER","TRIDENT","MOTHERSON","CESC","TECHM"]
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:25){
                        ForEach(1...7, id: \.self){ i in
                            Text("Watchlist \(i)")
                                .font(.subheadline)
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
                    .frame(height:0)
                    
                }
                
                //lists
                LazyHStack{
                    ForEach(1...7, id: \.self){ i in
                        List(names, id: \.self){ name in
                            listCell(name: name)
                                .gesture(
                                    LongPressGesture()
                                        .onEnded({ _ in
                                           
                                            
                                        })
                                )
                            
                        }
                        .listStyle(.plain)
                        
                            .padding(.horizontal,15)
                            .containerRelativeFrame(.horizontal)
                            .task{
                                listChoice = i
                            }
                            .offset(x:CGFloat(1200 - ((selectedTabIndex - 1) * 400)))
                        
                           
                    }
                }
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let threshold: CGFloat = 30
                            if value.translation.width >  threshold {
                                withAnimation{
                                    selectedTabIndex = max(listChoice - 1, 1)
                                    listChoice -= 1
                                }
                            }
                            else if value.translation.width < -threshold {
                                withAnimation{
                                   selectedTabIndex = min(listChoice + 1, 7)
                                    listChoice += 1
                                }
                            }
                            
                        })
                   
                )
                
            }
            
           
        }
    }
    

   
}

#Preview {
    WatchlistView()
}




