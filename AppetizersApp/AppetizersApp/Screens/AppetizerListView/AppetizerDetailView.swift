//
//  AppetizerDetailView.swift
//  AppetizersApp
//
//  Created by Aman Gupta on 05/01/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order: Order
    
    var appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack{
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height:225)
                Text(appetizer.name)
                    .font(.title)
                    .fontWeight(.medium)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                    
                HStack(spacing: 40){
                    VStack{
                        Text("Calories")
                            .fontWeight(.medium)
                            .italic()
                        Text("\(appetizer.calories)")
                    }
                    VStack{
                        Text("Carbs")
                            .fontWeight(.medium)
                            .italic()
                        Text("\(appetizer.carbs) g")
                    }
                    VStack{
                        Text("Protein")
                            .fontWeight(.medium)
                            .italic()
                        Text("\(appetizer.protein) g")
                    }
                }
                .padding(.bottom, 30)
                Button{
                    order.add(appetizer)
                    isShowingDetail = false
                }
            label:{
                    Text("$\(appetizer.price, specifier: "%.f") - Add To Order")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.brandPrimary)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal,40)
                    
                }
                
                Spacer()
                
                    
            }
            .frame(width: 320, height:525)
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .shadow(radius: 20)
            Circle()
                .foregroundColor(.white)
                .opacity(0.7)
                .frame(width:40, height:40)
                .padding(20)
                .overlay(
                    Image(systemName:"xmark")
                )
                .onTapGesture{
                    isShowingDetail = false
                }
            
    
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
}
