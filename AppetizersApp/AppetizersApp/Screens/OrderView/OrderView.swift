//
//  OrderView.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 04/01/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                                AppetizerListCell(appetizer: appetizer)
                                
                            }
                            .onDelete(perform:{ indexSet in
                                order.items.remove(atOffsets: indexSet)
                                
                            })
                            .listStyle(PlainListStyle())
                            
                            Button{
                                print("Order placed")
                            }
                        label:{
                            APButton(title:Text("$\(order.totalPrice, specifier: "%.f") - Place order"))
                            }
                    }
                    
                }
                if order.items.isEmpty {
                    EmptyState()
                }
            }
            
            
                .navigationTitle("Orders")
            
            
        }
    }
    
   
}

#Preview {
    OrderView()
}
