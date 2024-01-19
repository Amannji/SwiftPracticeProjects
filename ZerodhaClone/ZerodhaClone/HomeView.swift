//
//  HomeView.swift
//  ZerodhaClone
//
//  Created by Aman Gupta on 18/01/24.
//

import SwiftUI

struct HomeView: View {
    @State var showOverView: Bool = false
    @State var selectedTab: String = "WatchList"
    var body: some View {
        ZStack{
            Overview(showOverview: $showOverView)
            VStack{
                HStack{
                    Text(selectedTab)
                        .font(.system(size: 30, weight:.bold, design: .rounded))
                        
                    Spacer()
                    Image(systemName:"chevron.down")
                        .font(.system(size:30,weight: .bold))
                        .onTapGesture {
                            showOverView = true
                        }
                        
                }
                .padding([.top,.horizontal],20)
                TabView(selection: $selectedTab){
                    WatchlistView()
                        .font(.system(size:30,weight:.medium,design: .rounded))
                        .tabItem{
                            Image(systemName:"bookmark")
                            Text("Watchlist")
                        }
                    Text("Orders")
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .tabItem{
                            Image(systemName:"book.closed")
                            Text("Orders")
                        }
                        .tag("Orders")
                    
                    Text("Portfolio")
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .tabItem{
                            Image(systemName: "suitcase")
                            Text("Portfolio")
                        }
                        .tag("Portfolio")
                    Text("Bids")
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .tabItem{
                            Image(systemName:"banknote")
                            Text("Bids")
                        }
                        .tag("Bids")
                    Text("Profile")
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .tabItem{
                            Image(systemName:"person")
                            Text("Profile")
                    }
                        .tag("Profile")
                }
            }
            .background(Color.accent)
            .offset(y: showOverView ? 420 : 0)
        }
        .animation(.default, value:showOverView)
    }
}

struct HomeView_Preview:PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
