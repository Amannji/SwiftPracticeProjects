//
//  HomeView.swift
//  ZerodhaClone
//
//  Created by Aman Gupta on 18/01/24.
//

import SwiftUI

struct HomeView: View {
    @State var showOverView: Bool = false
    var body: some View {
        ZStack{
            Overview(showOverview: $showOverView)
            TabView{
                Group{
                    WatchlistView(showOverView: $showOverView)
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
                    
                    Text("Portfolio")
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .tabItem{
                            Image(systemName: "suitcase")
                            Text("Portfolio")
                        }
                    Text("Bids")
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .tabItem{
                            Image(systemName:"banknote")
                            Text("Bids")
                        }
                    Text("Profile")
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .tabItem{
                            Image(systemName:"person")
                            Text("Profile")
                    }
                }
                .padding(.top,20)
            }
            .offset(y: showOverView ? 450 : 0)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: showOverView ? 10 : 0)
            
        }
        .animation(.default, value:showOverView)
    }
}

struct HomeView_Preview:PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
