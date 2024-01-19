//
//  EditWatchlistView.swift
//  ZerodhaClone
//
//  Created by Aman Gupta on 18/01/24.
//

import SwiftUI

struct EditWatchlistView: View {
    @State var nameInput: String = "Watchlist"
    @State var selectedItem: String?
    @State var names:[String] = ["ICICI BANK","SBIN","TATAPOWER","TRIDENT","MOTHERSON","CESC","TECHM"]
    var body: some View {
        //top nav bar
        VStack{
            HStack(spacing:50){
                Image(systemName:"arrow.left")
                    .font(.system(size:30,weight:.medium,design:.rounded))
                Text("Edit watchlist")
                    .font(.system(size:25,weight: .medium,design:.rounded))
                Button{
                    
                }
            label:{
                Text("Save")
                    .foregroundColor(.white)
                    .padding(.horizontal,20)
                    .padding(.vertical,4)
            }
            .background(Color.blue)
            }
            .padding(.bottom,20)
            
            // namebar
            HStack{
                Text("Name")
                    .foregroundColor(Color(.secondaryLabel))
                TextField("Enter a name",text:$nameInput)
                Image(systemName: "pencil.and.scribble")
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(5.0)
            .padding(.horizontal)
            
            //list
            NavigationView{
                List{
                    ForEach(names, id: \.self){ name in
                        HStack{
                            Image(systemName:"squareshape.dotted.split.2x2")
                                .font(.title3)
                                .padding(.trailing,30)
                            VStack(alignment: .leading){
                                Text(name)
                                Text("NSE")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName:"trash")
                                .onTapGesture {
                                    if let index = names.firstIndex(of: name){
                                        self.names.remove(at: index)
                                    }
                                }
                        }
                    }
                    .onMove{(indexSet,index) in
                        self.names.move(fromOffsets:indexSet, toOffset: index)
                    }
                }
                .listRowInsets(EdgeInsets())
                .listStyle(.plain)
            }
            
        }
        
        
        
        
    }
        
    
}

#Preview {
    EditWatchlistView()
}

struct listCell:View{
    var name: String
    var body: some View{
        HStack{
            Image(systemName:"squareshape.dotted.split.2x2")
                .font(.title3)
                .padding(.trailing,30)
            VStack(alignment: .leading){
                Text(name)
                Text("NSE")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName:"trash")
        }
        
    }
}






