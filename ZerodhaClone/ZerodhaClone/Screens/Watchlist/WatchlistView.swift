//
//  WatchlistView.swift
//  ZerodhaClone
//
//  Created by Aman Gupta on 18/01/24.
//

import SwiftUI

struct WatchlistView: View {
    
    @State var listChoice:String = ""
    var body: some View {
        NavigationView{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(1...7, id: \.self){ i in
                        tabListChoice(text:"Watchlist \(i)")
                    }
                }
                .padding()
            }
        }
        
        
        
    }
}

#Preview {
    WatchlistView()
}


struct tabListChoice: View{
    var text: String
    var body: some View{
        Button{
            
        }
    label:{
        Text(text)
            .foregroundColor(Color.primary)
    }
    }
}
