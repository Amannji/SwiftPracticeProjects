//
//  AppetizerTabView.swift
//  AppetizerTemp
//
//  Created by Aman Gupta on 05/01/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
           AppetizerListView()
                .tabItem{
                    Image(systemName:"house")
                    Text("Home")
                }
                
            OrderView()
                .tabItem{
                    Image(systemName:"bag")
                    Text("Orders")
                }
            AccountView()
                .tabItem{
                    Image(systemName:"person")
                    Text("Account")
                }
        }
        .accentColor(.brandPrimaryColor)
        
    }
}

#Preview {
    AppetizerTabView()
}
