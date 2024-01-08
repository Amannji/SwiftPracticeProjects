//
//  AppetizerTabView.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem{
                    Image(systemName:"house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem{
                    Image(systemName:"person")
                        Text("Account")
                }
            OrderView()
                .tabItem{
                    Image(systemName:"bag")
                    Text("Order")
                }
                .badge(order.items.count)
        }
        .accentColor(.brandPrimaryColor)
    }
}

#Preview {
    AppetizerTabView()
}
